import 'dart:convert';
import 'dart:io';
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
          "Accept": "application/json"
        },
      );
    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body);
        final slotList = List<Slot>.from(data['slotsForMobileApp'].map((e) => Slot.fromJson(e[0])));
        return slotList;
      } on FormatException catch (e) {
        throw Exception('Failed to parse JSON data: ${e.message}');
      } on HttpException catch (e) {
        throw Exception('Network error: ${e.message}');
      }
    } else {
      throw Exception('Failed to load slots: ${response.reasonPhrase}');

    }

  }
}