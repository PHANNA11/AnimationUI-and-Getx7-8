import 'package:flutter/material.dart';
import 'package:fruits/controller/change_fonts_controller.dart';
import 'package:fruits/controller/change_local_language_controller.dart';
import 'package:fruits/controller/dark_mode_controller.dart';
import 'package:fruits/screen/flash_screen.dart';
import 'package:fruits/screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:developer' as dev;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await switchLanguageController.initLanguage();
  await GetStorage.init();
  runApp(const MyApp());
}

SwitchLanguageController switchLanguageController =
    Get.put(SwitchLanguageController());
ThemeModeController themeModeController = Get.put(ThemeModeController());
bool a = false;
FontsController fontsController = Get.put(FontsController());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(builder: (context) {
      return GetMaterialApp(
          translations: ChangeLocalControlller(),
          locale: switchLanguageController.english
              ? const Locale('en', 'US')
              : const Locale('KH', 'KH'),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: themeModeController.theme,
          home: const FlashScreen(),
          initialRoute: fontsController.initFonts().toString());
    });
  }
}
