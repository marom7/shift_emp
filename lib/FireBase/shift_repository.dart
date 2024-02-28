import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/shift_model.dart';

class ShiftRepository{

  final _db = FirebaseFirestore.instance;

  Future<ShiftModel> getShiftsDetails(String date) async {
    final snapshot = await _db.collection("Shifts").where("Date" ,isEqualTo: date).get();
    final shiftData = snapshot.docs.map((e) => ShiftModel.fromSnapshot(e)).single;
    return shiftData;
  }

  Future<List<ShiftModel>> allShifts() async {
    final snapshot = await _db.collection("Shifts").get();
    final allShifts = snapshot.docs.map((e) => ShiftModel.fromSnapshot(e)).toList();
    return allShifts;
  }
}