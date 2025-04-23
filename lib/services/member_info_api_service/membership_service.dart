import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:kbc_admin/models/membership.dart';
import 'package:kbc_admin/services/aut_token.dart';
import 'package:kbc_admin/services/base_url.dart';

class MembershipService {
  final String memberBaseUrl = "$baseUrl/api/member-info";

  List<Membership> membersList = [];

  Future<List<Membership>> getAllMembers() async {
    final url = Uri.parse('$memberBaseUrl/all');
    print('url: $url');
    try {
      final response = await http.get(
        url,
        headers: AuthToken.getHeaders(),
      );
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          dynamic jsonDecodeData = jsonDecode(response.body);
          print(jsonDecodeData);
          membersList = List<Membership>.from(
              jsonDecodeData.map((e) => Membership.fromJson(e)).toList());
          return membersList;
        } else {
          throw Exception('Body iko empty bro');
        }
      } else {
        dynamic jsonDecodeData = jsonDecode(response.body);
        print('For else: $jsonDecodeData');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
    throw Exception('Try to handle null values');
  }

  Future<Membership?> recordMember(Membership member) async {
    final url = Uri.parse('$memberBaseUrl/record');
    try {
      print('Request body: ${jsonEncode(member.toJson())}');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        //headers: AuthToken.getHeaders(),
        body: jsonEncode(member.toJson()),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);

        return Membership.fromJson(jsonData);
      } else {
        print('Member info body response: ${response.body}');
        print('Response code is ${response.statusCode}');
      }
    } catch (e) {
      print('Error is : $e');
      throw Exception('Error: $e');
    }
    return null;
  }

  Future<Membership?> findMemberById(int memberId) async {
    final url = Uri.parse('$memberBaseUrl/member/$memberId');
    try {
      final response = await http.get(
        url,
        headers: AuthToken.getHeaders(),
      );
      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);
        return Membership.fromJson(jsonData);
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
    return null;
  }

  // Future<User?> updateUser(int userId, User user) async {
  //   final url = Uri.parse('$userBaseUrl/update/$userId');
  //   try {
  //     final response = await http.put(
  //       url,

  //       headers: AuthToken.getHeaders(),
  //       //headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode(user.toJson()),
  //     );
  //     if (response.statusCode == 200) {
  //       dynamic jsonData = jsonDecode(response.body);
  //       return User.fromJson(jsonData);
  //     }
  //   } catch (e) {
  //     throw Exception('Error: $e');
  //   }
  //   return null;
  // }

  // Future<bool> deleteUser(int userId) async {
  //   final url = Uri.parse('$userBaseUrl/delete/$userId');
  //   try {
  //     final response = await http.delete(
  //       url,
  //       headers: AuthToken.getHeaders(),
  //     );
  //     if (response.statusCode == 200) {
  //       return true;
  //     }
  //   } catch (e) {
  //     throw Exception('Error: $e');
  //   }
  //   return false;
  // }

  Future<Membership?> login(
      String phoneNumber, String password, BuildContext context) async {
    final url = Uri.parse('$memberBaseUrl/login');
    try {
      // Create a login request object with phone number and password
      Map<String, dynamic> loginRequest = {
        'phoneNumber': phoneNumber,
        'password': password
      };

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(loginRequest),
      );

      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);

        // Store the JWT token
        AuthToken.setToken(jsonData['myJWT']);
        // Parse the LoginResponse into a User object
        print(jsonData);
        // Navigator.push(context,
        //     (MaterialPageRoute(builder: (context) => const HomePages())));
        return Membership.fromJson(jsonData);
      } else {
        // Handle different status codes appropriately
        if (response.statusCode == 400 || response.statusCode == 401) {
          throw Exception('Invalid credentials');
        } else if (response.statusCode == 403) {
          throw Exception('Account blocked');
        } else {
          throw Exception(
              'Login failed with status code: ${response.statusCode}');
        }
      }
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }
}
