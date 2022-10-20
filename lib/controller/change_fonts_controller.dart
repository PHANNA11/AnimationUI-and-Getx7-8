import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontsController extends GetxController {
  initFonts() async {
    final prefs = await SharedPreferences.getInstance();
    fontData = prefs.getString('fonts') ?? 'BungreeShade'.obs();
  }

  List? fontDataList = [
    'PlayfairDisplay',
    'Bangers',
    'BungreeShade',
    'Monoton',
    'Nabla',
    'RampartOne',
    'Yellowtail',
    'AmaticSC-Bold',
    'Cookie',
    'CrimsonPro-Italic',
    'CrimsonPro',
    'EBGaramond-Italic',
    'Lobster',
    'PetitFormalScript',
    'Playball',
    'Sacramento',
    'Sriracha',
    'Tangerine',
  ].obs();
  String? fontData;
  changeFonts(int fontIndex) async {
    final prefs = await SharedPreferences.getInstance();
    fontData = fontDataList![fontIndex];
    await prefs.setString('fonts', fontData!);

    update();
  }
}
