import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontsController extends GetxController {
  initFonts() async {
    final prefs = await SharedPreferences.getInstance();
    fontData = prefs.getString('fonts') ?? 'KhmerOS_sys'.obs();
    update();
  }

  List? fontDataList = [
    'khmer400',
    'KhmerOS_sys',
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
