import 'dart:convert';
import 'package:kbc_admin/models/discipleship_classes.dart';
import 'package:kbc_admin/services/aut_token.dart';
import 'package:kbc_admin/services/base_url.dart';
import 'package:http/http.dart' as http;

class DiscipleshipClassService {
  final String discipleshipClassBaseUrl = "$baseUrl/api/classes";

  List<DiscipleshipClass> discipleshipClassList = [];

  Future<List<DiscipleshipClass>> getAllDiscipleshipClassses() async {
    final url = Uri.parse('$discipleshipClassBaseUrl/all');
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
          discipleshipClassList = List<DiscipleshipClass>.from(jsonDecodeData
              .map((e) => DiscipleshipClass.fromJson(e))
              .toList());
          return discipleshipClassList;
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

  Future<bool> addDiscipleshipClass(DiscipleshipClass discipleshipClass) async {
    final url = Uri.parse('$discipleshipClassBaseUrl/post');
    try {
      print('Request body: ${jsonEncode(discipleshipClass.toJson())}');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        //headers: AuthToken.getHeaders(),
        body: jsonEncode(discipleshipClass.toJson()),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        // dynamic jsonData = jsonDecode(response.body);
        print('Posted');
        return true; //DiscipleshipClass.fromJson(jsonData);
      } else {
        print('DiscipleshipClass  body response: ${response.body}');
        print('Response code is ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error is : $e');
      throw Exception('Error: $e');
    }
  }

  Future<DiscipleshipClass?> findDiscipleshipClassById(int id) async {
    final url = Uri.parse('$discipleshipClassBaseUrl/by-id/$id');
    try {
      final response = await http.get(
        url,
        headers: AuthToken.getHeaders(),
      );
      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);
        return DiscipleshipClass.fromJson(jsonData);
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
    return null;
  }

  Future<bool> updateDiscipleshipClass(
      int id, DiscipleshipClass discipleshipClass) async {
    final url = Uri.parse('$discipleshipClassBaseUrl/update/$id');
    try {
      final response = await http.put(
        url,

        headers: AuthToken.getHeaders(),
        //headers: {'Content-Type': 'application/json'},
        body: jsonEncode(discipleshipClass.toJson()),
      );
      if (response.statusCode == 200) {
        // dynamic jsonData = jsonDecode(response.body);
        // return DiscipleshipClass.fromJson(jsonData);
        return true;
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
    return false;
  }

  Future<bool> deleteDiscipleshipClass(int id) async {
    final url = Uri.parse('$discipleshipClassBaseUrl/delete/$id');
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
