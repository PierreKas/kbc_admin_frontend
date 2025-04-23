import 'package:kbc_admin/models/announcement.dart';
import 'package:kbc_admin/services/announcement_service.dart';

class AnnouncementController {
  static int announcementId = 0;
  List<Announcement>? _announcementsList;
  Future<bool> postAnnouncement(Announcement announcement) async {
    try {
      // final returnedannouncement= await AnnouncementService().recordannouncement(announcement)
      print('announcement info: $announcement');
      // print('announcement info  : ${announcement.dateOfBirth}');
      // print('announcement info: ${announcement.joiningKbcDate}');
      // print('announcement info: ${announcement.phoneNumber}');
      // print('announcement info  : ${announcement.educationLevel}');
      // print('announcement info  : ${announcement.gender}');
      // print('announcement info  : ${announcement.names}');
      // print('announcement info : ${announcement.maritalStatus}');
      // print('announcement info : ${announcement.password}');
      // print('announcement info  : ${announcement.profession}');
      // print('announcement info  : ${announcement.placeOfBirth}');
      // print('announcement info  : ${announcement.residence}');
      // print('announcement info  : ${announcement.nationality}');

      return await AnnouncementService().postAnnouncement(announcement);
    } catch (e) {
      print('Error in controller $e');
    }
    return false;
  }

  // Future<Announcement?> announcementInfo(int id) async {
  //   Announcement? announcementInfo =
  //       await AnnouncementService().findannouncementById(id);
  //   return announcementInfo;
  // }

  Future<List<Announcement>?> getAllannouncements() async {
    _announcementsList = await AnnouncementService().getAllAnnouncements();
    return _announcementsList;
  }

  Future<Announcement?> getAnnouncementById(int id) async {
    return await AnnouncementService().findAnnouncementById(id);
  }

  Future<bool> updateAnnouncement(int id, Announcement announcement) async {
    return await AnnouncementService().updateAnnouncement(id, announcement);
  }

  Future<bool> deleteAnnouncement(int id) async {
    return AnnouncementService().deleteAnnouncement(id);
  }
}
