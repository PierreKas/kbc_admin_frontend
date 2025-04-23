import 'package:kbc_admin/models/discipleship_classes.dart';
import 'package:kbc_admin/services/discipleship_class_service.dart';

class DiscipleshipClassesController {
  static int discipleshipClassId = 0;
  List<DiscipleshipClass>? _discipleshipClassList;
  Future<bool> addDiscipleshipClass(DiscipleshipClass discipleshipClass) async {
    try {
      return await DiscipleshipClassService()
          .addDiscipleshipClass(discipleshipClass);
    } catch (e) {
      print('Error in controller $e');
    }
    return false;
  }

  // Future<DiscipleshipClass?> DiscipleshipClassInfo(int id) async {
  //   DiscipleshipClass? DiscipleshipClassInfo =
  //       await DiscipleshipClassService().findDiscipleshipClassById(id);
  //   return DiscipleshipClassInfo;
  // }

  Future<List<DiscipleshipClass>?> getAllDiscipleshipClassses() async {
    _discipleshipClassList =
        await DiscipleshipClassService().getAllDiscipleshipClassses();
    return _discipleshipClassList;
  }

  Future<DiscipleshipClass?> getDiscipleshipClassById(int id) async {
    return await DiscipleshipClassService().findDiscipleshipClassById(id);
  }

  Future<bool> updateDiscipleshipClass(
      int id, DiscipleshipClass discipleshipClass) async {
    return await DiscipleshipClassService()
        .updateDiscipleshipClass(id, discipleshipClass);
  }

  Future<bool> deleteDiscipleshipClass(int id) async {
    return DiscipleshipClassService().deleteDiscipleshipClass(id);
  }
}
