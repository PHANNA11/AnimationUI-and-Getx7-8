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
              urlLogo:
                  'https://imgs.search.brave.com/y0Xl_v7HVyD-lIRNAani2YXtbAW8Vqdr64W9ZJYyQbo/rs:fit:300:300:1/g:ce/aHR0cHM6Ly93d3cu/ZWR1cmVrYS5jby9i/bG9nL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDE5LzA2L0ZMdXR0/ZXItTG9nby1GbHV0/dGVyLXZzLVJlYWN0/LU5hdGl2ZS1lZHVy/ZWthLTMwMHgzMDAu/cG5n',
              logoName: 'Flutter ',
              link: 'https://docs.flutter.dev/',
            ),
            SocialWidget(
              urlLogo:
                  'https://imgs.search.brave.com/7ulQhDe-3Xal-c1RuURahETWpqbDpRRV1HkcyipG0Mw/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly8xMDAw/bG9nb3MubmV0L3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE3LzA1/L05ldy1Zb3VUdWJl/LWxvZ28uanBn',
              logoName: 'Flutter',
              link: 'https://www.youtube.com/flutterdev',
            ),
            SocialWidget(
              urlLogo:
                  'https://imgs.search.brave.com/7aDvJl3_0dinwO5c5PVZzTnSZRr7aWSbnBAxjH6wEgE/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Ux/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5a/Mm9oZFJ4d3Y4aGpn/ejFxekxfZzhRSGFI/YSZwaWQ9QXBp',
              logoName: 'Flutter',
              link: 'https://twitter.com/FlutterDev',
            ),
            SocialWidget(
              urlLogo:
                  'https://imgs.search.brave.com/M57dBjKsHVz-QLczOADoGopJrrKjCo0Y7zSq0k_AXAc/rs:fit:838:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5S/RzJQS05aelRLUW1C/ZzNvc1E0eld3SGFF/TSZwaWQ9QXBp',
              logoName: 'Flutter',
              link: 'https://github.com/flutter',
            ),
          ],
        ),
      );
    });
  }
}
