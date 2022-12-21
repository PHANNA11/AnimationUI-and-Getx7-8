import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/Auth/local_auth.dart';

import 'package:fruits/controller/change_fonts_controller.dart';
import 'package:fruits/controller/change_local_language_controller.dart';
import 'package:fruits/controller/dark_mode_controller.dart';
import 'package:fruits/controller/lock_screen_controller.dart';
import 'package:fruits/screen/change_font_screen.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

ThemeModeController themeModeController = Get.put(ThemeModeController());
FontsController fontsController = Get.put(FontsController());
SwitchLanguageController switchLanguageController =
    Get.put(SwitchLanguageController());
LockScreenController lockScreenController = Get.put(LockScreenController());

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Future<void> localAuth() async {
    final localAuth = LocalAuthentication();
    final didAuthenticate = await localAuth.authenticate(
        localizedReason: 'Please scan authenticate');

    if (didAuthenticate) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontsController>(
        init: fontsController,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'settings'.tr,
                style: TextStyle(
                    fontSize: 28, fontFamily: fontsController.fontData),
              ),
            ),
            body: Column(
              children: [
                SimpleBuilder(builder: (contextdarkMode) {
                  return ListTile(
                    leading: Icon(
                      themeModeController.isDark
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      size: 30,
                    ),
                    title: themeModeController.isDark
                        ? Text(
                            'dark_mode'.tr,
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: fontsController.fontData),
                          )
                        : Text(
                            'light_mode'.tr,
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: fontsController.fontData),
                          ),
                    trailing: CupertinoSwitch(
                        value: themeModeController.isDark,
                        onChanged: themeModeController.changeTheme),
                  );
                }),
                const Divider(),
                GetBuilder<SwitchLanguageController>(
                    init: switchLanguageController,
                    builder: (contextLanguage) {
                      return ListTile(
                        leading: const Icon(
                          Icons.language,
                          size: 30,
                        ),
                        title: Text(
                          'ភាសាខ្មែរ / English',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: fontsController.fontData),
                        ),
                        trailing: CupertinoSwitch(
                            value: switchLanguageController.english,
                            onChanged: (value) async {
                              var localeEng = const Locale('en', 'US');
                              var localeKh = const Locale('KH', 'KH');
                              switchLanguageController.switchLanguage(value);
                              Get.updateLocale(value ? localeEng : localeKh);
                            }),
                      );
                    }),
                const Divider(),
                GetBuilder<LockScreenController>(
                    init: lockScreenController,
                    builder: (controller) {
                      return ListTile(
                        leading: const Icon(
                          Icons.fingerprint,
                          size: 30,
                        ),
                        title: Text(
                          'Login With FingerPrint',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: fontsController.fontData),
                        ),
                        trailing: CupertinoSwitch(
                            value: lockScreenController.fingerprint!,
                            onChanged: (value) async {
                              lockScreenController.chekFingerPrin(value);
                              if (value == true) {
                                await localAuth();
                              }
                            }),
                      );
                    }),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.face_outlined,
                    size: 30,
                  ),
                  title: Text(
                    'Login With FaceID',
                    style: TextStyle(
                        fontSize: 18, fontFamily: fontsController.fontData),
                  ),
                  trailing: CupertinoSwitch(
                      value: false, //LocalAuth().lockByFaceID,
                      onChanged: (value) async {
                        print('FaceID:$value');
                        await localAuth();
                      }),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.lock_outlined,
                    size: 30,
                  ),
                  title: Text(
                    'Lock screen',
                    style: TextStyle(
                        fontSize: 18, fontFamily: fontsController.fontData),
                  ),
                  subtitle: Text(
                    'change password',
                    style: TextStyle(fontFamily: fontsController.fontData),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    Get.to(() => const ChangeFontScreen());
                  },
                  child: ListTile(
                    leading: const Icon(
                      Icons.font_download,
                      size: 30,
                    ),
                    title: Text(
                      'Fonts',
                      style: TextStyle(
                          fontSize: 18, fontFamily: fontsController.fontData),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                const Divider(),
              ],
            ),
          );
        });
  }
}
