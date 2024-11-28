import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class BarbershopController extends GetxController {
  var data = {}.obs;

  @override
  void onInit() {
    super.onInit();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final jsonString = await rootBundle.loadString('assets/barbershops.json');
    data.value = jsonDecode(jsonString);
  }
}
