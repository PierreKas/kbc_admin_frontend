import 'package:kbc_admin/models/kingdom_home.dart';
import 'package:kbc_admin/services/kingdomhome_service.dart';

class KingdomHomeController {
  static int kingdomHomeId = 0;
  List<KingdomHome>? _kingdomHomesList;
  Future<bool> createKingdomHome(KingdomHome kingdomHome) async {
    try {
      return await KingdomHomeService().createKingdomHome(kingdomHome);
    } catch (e) {
      print('Error in controller $e');
    }
    return false;
  }

  // Future<KingdomHome?> KingdomHomeInfo(int id) async {
  //   KingdomHome? KingdomHomeInfo =
  //       await KingdomHomeService().findKingdomHomeById(id);
  //   return KingdomHomeInfo;
  // }

  Future<List<KingdomHome>?> getAllKingdomHomes() async {
    _kingdomHomesList = await KingdomHomeService().getAllKingdomHomes();
    return _kingdomHomesList;
  }

  Future<KingdomHome?> getKingdomHomeById(int id) async {
    return await KingdomHomeService().findKingdomHomeById(id);
  }

  Future<bool> updateKingdomHome(int id, KingdomHome kingdomHome) async {
    return await KingdomHomeService().updateKingdomHome(id, kingdomHome);
  }

  Future<bool> deleteKingdomHome(int id) async {
    return KingdomHomeService().deleteKingdomHome(id);
  }
}
