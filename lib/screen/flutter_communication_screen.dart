import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruits/controller/change_fonts_controller.dart';
import 'package:fruits/widget/social_widget.dart';
import 'package:get/get.dart';

FontsController fontsController = Get.put(FontsController());

class communicationScreen extends StatelessWidget {
  const communicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontsController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'FLutter',
            style: TextStyle(
              fontFamily: fontsController.fontData,
              fontSize: 40,
            ),
          ),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'FLutter Communication',
                style: TextStyle(fontFamily: 'Bangers', fontSize: 35),
              ),
            ),
            const Center(
              child: SizedBox(
                height: 150,
                width: 300,
                child: FlutterLogo(),
              ),
            ),
            SocialWidget(
              urlLogo: 'flutter.png',
              logoName: 'Flutter ',
              link: 'https://docs.flutter.dev/',
            ),
            SocialWidget(
              urlLogo: 'youtube.png',
              logoName: 'Flutter',
              link: 'https://www.youtube.com/flutterdev',
            ),
            SocialWidget(
              urlLogo: 'twitter.png',
              logoName: 'Flutter',
              link: 'https://twitter.com/FlutterDev',
            ),
            SocialWidget(
              urlLogo: 'github.png',
              logoName: 'Flutter',
              link: 'https://github.com/flutter',
            ),
          ],
        ),
      );
    });
  }
}
