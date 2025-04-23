import 'dart:convert';

import 'package:kbc_admin/models/kingdom_home.dart';
import 'package:kbc_admin/services/aut_token.dart';
import 'package:kbc_admin/services/base_url.dart';
import 'package:http/http.dart' as http;

class KingdomHomeService {
  final String kingdomHomeBaseUrl = "$baseUrl/api/kingdomhome";

  List<KingdomHome> kingdomHomesList = [];

  Future<List<KingdomHome>> getAllKingdomHomes() async {
    final url = Uri.parse('$kingdomHomeBaseUrl/all');
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
          kingdomHomesList = List<KingdomHome>.from(
              jsonDecodeData.map((e) => KingdomHome.fromJson(e)).toList());
          return kingdomHomesList;
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

  Future<bool> createKingdomHome(KingdomHome kingdomHome) async {
    final url = Uri.parse('$kingdomHomeBaseUrl/add');
    try {
      print('Request body: ${jsonEncode(kingdomHome.toJson())}');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        //headers: AuthToken.getHeaders(),
        body: jsonEncode(kingdomHome.toJson()),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        // dynamic jsonData = jsonDecode(response.body);
        print('Posted');
        return true; //KingdomHome.fromJson(jsonData);
      } else {
        print('KingdomHome  body response: ${response.body}');
        print('Response code is ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error is : $e');
      throw Exception('Error: $e');
    }
  }

  Future<KingdomHome?> findKingdomHomeById(int id) async {
    final url = Uri.parse('$kingdomHomeBaseUrl/by-id/$id');
    try {
      final response = await http.get(
        url,
        headers: AuthToken.getHeaders(),
      );
      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);
        return KingdomHome.fromJson(jsonData);
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
    return null;
  }

  Future<bool> updateKingdomHome(int id, KingdomHome kingdomHome) async {
    final url = Uri.parse('$kingdomHomeBaseUrl/update/$id');
    try {
      final response = await http.put(
        url,

        headers: AuthToken.getHeaders(),
        //headers: {'Content-Type': 'application/json'},
        body: jsonEncode(kingdomHome.toJson()),
      );
      if (response.statusCode == 200) {
        // dynamic jsonData = jsonDecode(response.body);
        // return KingdomHome.fromJson(jsonData);
        return true;
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
    return false;
  }

  Future<bool> deleteKingdomHome(int id) async {
    final url = Uri.parse('$kingdomHomeBaseUrl/delete/$id');
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
