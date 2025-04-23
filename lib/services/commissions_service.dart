import 'dart:convert';

import 'package:kbc_admin/models/commissions.dart';
import 'package:kbc_admin/services/aut_token.dart';
import 'package:kbc_admin/services/base_url.dart';
import 'package:http/http.dart' as http;

class CommissionsService {
  final String commissionsBaseUrl = "$baseUrl/api/commission";

  List<Commissions> commissionsList = [];

  Future<List<Commissions>> getAllCommissionss() async {
    final url = Uri.parse('$commissionsBaseUrl/all');
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
          commissionsList = List<Commissions>.from(
              jsonDecodeData.map((e) => Commissions.fromJson(e)).toList());
          return commissionsList;
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

  Future<bool> createCommission(Commissions commission) async {
    final url = Uri.parse('$commissionsBaseUrl/post');
    try {
      print('Request body: ${jsonEncode(commission.toJson())}');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        //headers: AuthToken.getHeaders(),
        body: jsonEncode(commission.toJson()),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        //dynamic jsonData = jsonDecode(response.body);
        print('created');
        return true; //Commissions.fromJson(jsonData);
      } else {
        print('Commissions  body response: ${response.body}');
        print('Response code is ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error is : $e');
      throw Exception('Error: $e');
    }
  }

  Future<Commissions?> findCommissionsById(int id) async {
    final url = Uri.parse('$commissionsBaseUrl/by-id/$id');
    try {
      final response = await http.get(
        url,
        headers: AuthToken.getHeaders(),
      );
      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);
        return Commissions.fromJson(jsonData);
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
    return null;
  }

  Future<bool> updateCommission(int id, Commissions commission) async {
    final url = Uri.parse('$commissionsBaseUrl/update/$id');
    try {
      final response = await http.put(
        url,

        headers: AuthToken.getHeaders(),
        //headers: {'Content-Type': 'application/json'},
        body: jsonEncode(commission.toJson()),
      );
      if (response.statusCode == 200) {
        // dynamic jsonData = jsonDecode(response.body);
        // return Commissions.fromJson(jsonData);
        return true;
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
    return false;
  }

  Future<bool> deleteCommission(int id) async {
    final url = Uri.parse('$commissionsBaseUrl/delete/$id');
    try {
      final response = await http.delete(
        url,
        headers: AuthToken.getHeaders(),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
    return false;
  }
}
