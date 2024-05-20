import 'dart:convert';
import 'package:http/http.dart';

import '../../domain/model/slot.dart';

class SlotRepository {
  String baseURL = 'https://localhost:2222/Slots/GetSlotsForMobileApp';

  Future<List<Slot>> getSlots() async {
    Response response = await get(Uri.parse(baseURL));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => Slot.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}