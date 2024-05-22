import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

import '../../domain/model/slot.dart';

class SlotRepository {
  String baseURL = 'https://2283-217-29-24-183.ngrok-free.app/Slots/GetSlotsForMobileApp?departmentId=14&semesterId=13&dayOfWeek=1&groupId=29';
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<List<Slot>> getSlots() async {
    final User? user = _firebaseAuth.currentUser;
    final idToken = await user?.getIdToken();
    Response response = await get(
        Uri.parse(baseURL),
        headers: {
          'Authorization': 'Bearer $idToken',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      );
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['slotsForMobileApp'];
      print(result);
      return result.map((e) => Slot.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}