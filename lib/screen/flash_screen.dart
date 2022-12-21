import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruits/controller/change_fonts_controller.dart';
import 'package:fruits/screen/finger_prin.dart';
import 'package:fruits/screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:tbib_splash_screen/splash_screen.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

FontsController fontsController = Get.put(FontsController());

class FlashScreen extends StatelessWidget {
  const FlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontsController>(
        init: fontsController,
        builder: (context) {
          return Scaffold(
            body: SplashScreenView(
              //navigateWhere: true,
              // navigateRoute: FingerPrin(),
              navigateRoute: const MyHomePage(
                title: 'Fruit Mart ',
              ),
              text: WavyAnimatedText("Welcome to Fruit Mart",
                  textStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
              imageSrc: "assets/jsons/123638-sphere.json",
              displayLoading: true,
              duration: const Duration(seconds: 5),
              logoSize: 400,
              linearGradient: const LinearGradient(colors: [
                // Colors.yellowAccent,
                // Colors.purpleAccent,
                Colors.blueAccent,
                Colors.greenAccent
              ]),
            ),
          );
        });
  }
}
