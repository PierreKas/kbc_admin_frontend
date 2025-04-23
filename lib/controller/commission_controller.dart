import 'package:kbc_admin/models/commissions.dart';
import 'package:kbc_admin/services/commissions_service.dart';

class CommissionsController {
  static int commissionsId = 0;
  List<Commissions>? _commissionList;
  Future<bool> createCommission(Commissions commission) async {
    try {
      return await CommissionsService().createCommission(commission);
    } catch (e) {
      print('Error in controller $e');
    }
    return false;
  }

  // Future<Commissions?> CommissionsInfo(int id) async {
  //   Commissions? CommissionsInfo =
  //       await CommissionsService().findCommissionsById(id);
  //   return CommissionsInfo;
  // }

  Future<List<Commissions>?> getAllCommissions() async {
    _commissionList = await CommissionsService().getAllCommissionss();
    return _commissionList;
  }

  Future<Commissions?> getCommissionsById(int id) async {
    return await CommissionsService().findCommissionsById(id);
  }

  Future<bool> updateCommissions(int id, Commissions commission) async {
    return await CommissionsService().updateCommission(id, commission);
  }

  Future<bool> deleteCommissions(int id) async {
    return CommissionsService().deleteCommission(id);
  }
}
