import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/controller/change_fonts_controller.dart';

import 'package:fruits/model/user_model.dart';
import 'package:fruits/screen/about_screen.dart';
import 'package:fruits/screen/dashboard_screen.dart';
import 'package:fruits/screen/flutter_communication_screen.dart';
import 'package:fruits/screen/setting_screen.dart';
import 'package:get/get.dart';

FontsController fontsController = Get.put(FontsController());

class UserProfile extends StatelessWidget {
  UserProfile({super.key, required this.user});
  User user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<FontsController>(
          init: fontsController,
          builder: (controller) {
            return Drawer(
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    // color: const Color.fromARGB(255, 197, 212, 238),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage(user.imageProfile))),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    user.userName,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: fontsController.fontData),
                                  ),
                                  const Text(
                                    '@pha_phanna',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          user.email,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: fontsController.fontData),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  SimpleBuilder(builder: (context) {
                    return ListTile(
                      title: themeModeController.isDark
                          ? Text(
                              'Dark Mode',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: fontsController.fontData),
                            )
                          : Text(
                              'Light Mode',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: fontsController.fontData),
                            ),
                      trailing: CupertinoSwitch(
                          value: themeModeController.isDark,
                          onChanged: themeModeController.changeTheme),
                    );
                  }),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 300),
                            pageBuilder: (context, animation, _) =>
                                FadeTransition(
                              opacity: animation,
                              child: const DashBoardScreen(),
                            ),
                          ));
                    },
                    child: ListTile(
                      leading: const Icon(Icons.dashboard),
                      title: Text(
                        'Dashboard',
                        style: TextStyle(
                            fontSize: 18, fontFamily: fontsController.fontData),
                      ),
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 100),
                            pageBuilder: (context, animation, _) =>
                                FadeTransition(
                              opacity: animation,
                              child: const SettingScreen(),
                            ),
                          ));
                    },
                    child: ListTile(
                      leading: Icon(Icons.settings),
                      title: Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 18, fontFamily: fontsController.fontData),
                      ),
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 300),
                            pageBuilder: (context, animation, _) =>
                                FadeTransition(
                              opacity: animation,
                              child: const communicationScreen(),
                            ),
                          ));
                      // Get.to(() => const communicationScreen());
                    },
                    child: ListTile(
                      leading: Icon(Icons.public),
                      title: Text(
                        'Community',
                        style: TextStyle(
                            fontSize: 18, fontFamily: fontsController.fontData),
                      ),
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 300),
                            pageBuilder: (context, animation, _) =>
                                FadeTransition(
                              opacity: animation,
                              child: AboutScreen(user: user),
                            ),
                          ));
                    },
                    child: ListTile(
                      leading: Icon(Icons.account_box),
                      title: Text(
                        'About',
                        style: TextStyle(
                            fontSize: 18, fontFamily: fontsController.fontData),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
