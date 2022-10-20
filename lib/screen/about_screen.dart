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
                'About Me',
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
                                      image: NetworkImage(user.imageProfile))),
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
                  urlLogo:
                      'https://imgs.search.brave.com/EhSx0xOHBz409rYZlGKmRfkWw7qJr27_aa5GqJ_tDyc/rs:fit:640:640:1/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vNzM2/eC8xOS9mNi9iZi8x/OWY2YmY4ZmM2NzZj/YzFhMjQ2YmNiMDg2/YjJhZDY4YS5qcGc',
                  logoName: 'Facebook',
                  link: 'https://www.facebook.com/alton.kh.9',
                ),
                SocialWidget(
                  urlLogo:
                      'https://imgs.search.brave.com/7ulQhDe-3Xal-c1RuURahETWpqbDpRRV1HkcyipG0Mw/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly8xMDAw/bG9nb3MubmV0L3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE3LzA1/L05ldy1Zb3VUdWJl/LWxvZ28uanBn',
                  logoName: 'Youtube',
                  link:
                      'https://studio.youtube.com/channel/UC9PsVMffpxfe8xlZ71tyObg',
                ),
                SocialWidget(
                  urlLogo:
                      'https://imgs.search.brave.com/0dJYYcYebPERhhwzTXoiabkbzUw-CsdHtFMDSEKbtxs/rs:fit:844:225:1/g:ce/aHR0cHM6Ly90c2Ux/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5x/Y2paY2w4WVFqUU1h/QzJKQlNUYmpnSGFF/SyZwaWQ9QXBp',
                  logoName: 'Telegram',
                  link: 'https://t.me/pha_phanna',
                ),
                SocialWidget(
                  urlLogo:
                      'https://imgs.search.brave.com/M57dBjKsHVz-QLczOADoGopJrrKjCo0Y7zSq0k_AXAc/rs:fit:838:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5S/RzJQS05aelRLUW1C/ZzNvc1E0eld3SGFF/TSZwaWQ9QXBp',
                  logoName: 'Github',
                  link: 'https://github.com/PHANNA11/',
                ),
              ],
            ),
          );
        });
  }
}
