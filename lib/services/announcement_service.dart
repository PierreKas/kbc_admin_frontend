import 'dart:convert';

import 'package:kbc_admin/models/announcement.dart';
import 'package:kbc_admin/services/aut_token.dart';
import 'package:kbc_admin/services/base_url.dart';
import 'package:http/http.dart' as http;

class AnnouncementService {
  final String announcementBaseUrl = "$baseUrl/api/announcement";

  List<Announcement> announcementsList = [];

  Future<List<Announcement>> getAllAnnouncements() async {
    final url = Uri.parse('$announcementBaseUrl/all');
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
          announcementsList = List<Announcement>.from(
              jsonDecodeData.map((e) => Announcement.fromJson(e)).toList());
          return announcementsList;
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

  Future<bool> postAnnouncement(Announcement announcement) async {
    final url = Uri.parse('$announcementBaseUrl/post');
    try {
      print('Request body: ${jsonEncode(announcement.toJson())}');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        //headers: AuthToken.getHeaders(),
        body: jsonEncode(announcement.toJson()),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        // dynamic jsonData = jsonDecode(response.body);
        print('Posted');
        return true; //Announcement.fromJson(jsonData);
      } else {
        print('announcement  body response: ${response.body}');
        print('Response code is ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error is : $e');
      throw Exception('Error: $e');
    }
  }

  Future<Announcement?> findAnnouncementById(int id) async {
    final url = Uri.parse('$announcementBaseUrl/by-id/$id');
    try {
      final response = await http.get(
        url,
        headers: AuthToken.getHeaders(),
      );
      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);
        return Announcement.fromJson(jsonData);
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
    return null;
  }

  Future<bool> updateAnnouncement(int id, Announcement announcement) async {
    final url = Uri.parse('$announcementBaseUrl/update/$id');
    try {
      final response = await http.put(
        url,

        headers: AuthToken.getHeaders(),
        //headers: {'Content-Type': 'application/json'},
        body: jsonEncode(announcement.toJson()),
      );
      if (response.statusCode == 200) {
        // dynamic jsonData = jsonDecode(response.body);
        // return Announcement.fromJson(jsonData);
        return true;
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
    return false;
  }

  Future<bool> deleteAnnouncement(int id) async {
    final url = Uri.parse('$announcementBaseUrl/delete/$id');
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
