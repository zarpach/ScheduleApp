import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:schedule_app/domain/internal/baseUrl.dart';

import '../../domain/model/slot.dart';

class SlotRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<List<Slot>> getSlots({
    required int departmentId,
    required int groupId,
    required int dayOfWeek,
  }) async {
    final User? user = _firebaseAuth.currentUser;
    final idToken = await user?.getIdToken();
    final slotUrl = BaseUrl();
    final url = Uri.https(
      slotUrl.url,
      'Slots/GetSlotsForMobileApp',
      {
        'departmentId' : departmentId.toString(),
        'semesterId': '13',
        'dayOfWeek': dayOfWeek.toString(),
        'groupId': groupId.toString()
      }
    );
    print(url);
    Response response = await get(
      url,
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
