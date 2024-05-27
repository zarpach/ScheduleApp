import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:schedule_app/domain/internal/baseUrl.dart';
import 'package:schedule_app/domain/search_parameters/slot_search_parameters.dart';

import '../../domain/search_parameters/department_option.dart';
import '../../domain/search_parameters/group_option.dart';

class SearchRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<SlotSearchParameters> getSlotSearchParameters() async {
    final User? user = _firebaseAuth.currentUser;
    final idToken = await user?.getIdToken();
    final slotUrl = BaseUrl();
    final url =  Uri.https(
      slotUrl.url,
      'Slots/GetSlotSearchParameters',
    );
    final response = await get(
      url,
      headers: {
        'Authorization': 'Bearer $idToken',
        "Accept": "application/json"
      },
    );

    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body);

        final departments = List<DepartmentOption>.from(data['departments']
            .map((e) => DepartmentOption.fromJson(e)));

        final groups = List<GroupOption>.from(data['departmentGroups']
            .map((e) => GroupOption.fromJson(e)));

        return SlotSearchParameters(departments: departments, groups: groups);
      } on FormatException catch (e) {
        throw FormatException('Failed to parse JSON data: ${e.message}');
      } on HttpException catch (e) {
        throw HttpException('Network error: ${e.message}');
      } on Exception catch (e) {
        throw Exception(e);
      }
    } else {
      throw Exception('Failed to load slot search parameters: ${response.reasonPhrase}');
    }
  }
}
