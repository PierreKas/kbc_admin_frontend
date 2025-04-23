import 'package:flutter/material.dart';
import 'package:kbc_admin/components/snack_bar.dart';
import 'package:kbc_admin/models/membership.dart';
import 'package:kbc_admin/services/member_info_api_service/membership_service.dart';

class MembershipController {
  static int memberId = 0;
  List<Membership>? _membersList;
  Future<Membership?> recordMember(Membership member) async {
    try {
      // final returnedMember= await MembershipService().recordMember(member)
      print('member info: $member');
      print('member info  : ${member.dateOfBirth}');
      print('member info: ${member.joiningKbcDate}');
      print('member info: ${member.phoneNumber}');
      print('member info  : ${member.educationLevel}');
      print('member info  : ${member.gender}');
      print('member info  : ${member.names}');
      print('member info : ${member.maritalStatus}');
      print('member info : ${member.password}');
      print('member info  : ${member.profession}');
      print('member info  : ${member.placeOfBirth}');
      print('member info  : ${member.residence}');
      print('member info  : ${member.nationality}');

      return await MembershipService().recordMember(member);
    } catch (e) {
      print('member info  error: ${member.educationLevel}');
      print('member info  error: ${member.gender}');
      print('member info error : ${member.names}');
      print('Error in controller $e');
    }
    return null;
  }

  Future<Membership?> memberInfo(int id) async {
    Membership? memberInfo = await MembershipService().findMemberById(id);
    return memberInfo;
  }

  Future<List<Membership>?> getAllMembers() async {
    _membersList = await MembershipService().getAllMembers();
    return _membersList;
  }

  Future<bool> login(
      String phoneNumber, String password, BuildContext context) async {
    if (phoneNumber.isEmpty || password.isEmpty) {
      MySnackBar.showErrorMessage(
          'Please, Fill all the required fields', context);
      return false;
    }

    final member =
        await MembershipService().login(phoneNumber, password, context);

    if (member != null) {
      memberId = member.id!;
      print('Login is success');

      return true;
    } else {
      print('Login is failed');

      return false;
    }
  }
}
