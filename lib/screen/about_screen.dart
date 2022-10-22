import 'package:flutter/material.dart';
import 'package:fruits/controller/change_fonts_controller.dart';
import 'package:fruits/model/user_model.dart';
import 'package:fruits/widget/social_widget.dart';
import 'package:get/get.dart';

FontsController fontsController = Get.put(FontsController());

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key, required this.user});
  User user;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontsController>(
        init: fontsController,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'about_me'.tr,
                style: TextStyle(
                    fontFamily: fontsController.fontData,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  //  color: const Color.fromARGB(255, 197, 212, 238),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/profile_pic/${user.imageProfile}'))),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  user.userName,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: fontsController.fontData),
                                ),
                                Text(
                                  '096*****77',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: fontsController.fontData),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        user.email,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: fontsController.fontData),
                      ),
                      Text(
                        user.address,
                        style: TextStyle(
                            fontSize: 18, fontFamily: fontsController.fontData),
                      ),
                    ],
                  ),
                ),
                SocialWidget(
                  urlLogo: 'fb.png',
                  logoName: 'Facebook',
                  link: 'https://www.facebook.com/alton.kh.9',
                ),
                SocialWidget(
                  urlLogo: 'youtube.png',
                  logoName: 'Youtube',
                  link:
                      'https://studio.youtube.com/channel/UC9PsVMffpxfe8xlZ71tyObg',
                ),
                SocialWidget(
                  urlLogo: 'telegram.png',
                  logoName: 'Telegram',
                  link: 'https://t.me/pha_phanna',
                ),
                SocialWidget(
                  urlLogo: 'github.png',
                  logoName: 'Github',
                  link: 'https://github.com/PHANNA11/',
                ),
              ],
            ),
          );
        });
  }
}
