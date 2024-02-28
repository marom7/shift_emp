import 'package:cloud_firestore/cloud_firestore.dart';

class ShiftModel
{
  final String? id;
  final String date;
  final String shifts;

  const ShiftModel({
    this.id,
    required this.date,
    required this.shifts
  });

  toJson() {
    return {"Date": date,"shifts": shifts};
  }

  factory ShiftModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data();
    return
      ShiftModel(id: document.id, date: data!["Date"], shifts: data["shifts"]);
  }

  static String empNameByCode(int empCode) {
    switch (empCode) {
      case 0:
        return 'מרום';
      case 1:
        return 'ניר';
      case 2:
        return 'דב';
      case 3:
        return 'ליאור';
      case 4:
        return 'רומן';
      case 5:
        return 'איציק';
      default:
        return '-';
    }
  }
  static String shiftByCode(int shiftCode) {
    switch (shiftCode) {
      case 1:
        return 'משמרת בוקר 06:30';
      case 2:
        return 'עובד מהבית';
      case 3:
        return 'עובד בנמל';
      case 4:
        return 'חופשה/מחלה';
      case 0:
        return 'אין מידע';
      default:
        return '-';
    }
  }

}