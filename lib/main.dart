import 'package:flutter/material.dart';
import 'package:fruits/controller/dark_mode_controller.dart';
import 'package:fruits/model/fruit_model.dart';
import 'package:fruits/screen/home_screen.dart';
import 'package:fruits/screen/setting_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

ThemeModeController themeModeController = Get.put(ThemeModeController());
bool a = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(builder: (context) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeModeController.theme,
        home: const MyHomePage(
          title: 'Fruit Mart',
        ),
        initialRoute: fontsController.initFonts().toString(),
        // builder: (context, child) => fontsController.initFonts(),
      );
    });
  }
}
