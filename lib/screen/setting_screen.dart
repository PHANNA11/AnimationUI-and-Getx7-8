import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fruits/controller/change_fonts_controller.dart';
import 'package:fruits/controller/dark_mode_controller.dart';
import 'package:get/get.dart';

bool isDarkMode = false;
ThemeModeController themeModeController = Get.put(ThemeModeController());
FontsController fontsController = Get.put(FontsController());

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontsController>(
        init: fontsController,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'setting'.tr,
                style: TextStyle(
                    fontSize: 28, fontFamily: fontsController.fontData),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          fontsController.fontDataList!.length,
                          (index) => InkWell(
                            onTap: () async {
                              fontsController.changeFonts(index);
                            },
                            child: ListTile(
                              title: Text(
                                fontsController.fontDataList![index],
                                style: TextStyle(
                                    fontFamily:
                                        fontsController.fontDataList![index],
                                    fontSize: 22),
                              ),
                              trailing: fontsController.fontDataList![index] ==
                                      fontsController.fontData
                                  ? const Icon(
                                      Icons.done,
                                      size: 28,
                                      color: Colors.red,
                                    )
                                  : const SizedBox(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
