import 'package:flutter/material.dart';
import 'package:fruits/controller/change_fonts_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_launcher/app_launcher.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

class SocialWidget extends StatelessWidget {
  SocialWidget(
      {super.key,
      required this.logoName,
      required this.urlLogo,
      required this.link});
  String urlLogo;
  String logoName;
  String link;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontsController>(builder: (controller) {
      return InkWell(
        onTap: () async {
          await _launchInBrowser(Uri.parse(link));
        },
        child: Card(
          elevation: 0,
          //color: const Color.fromARGB(255, 184, 232, 240),
          child: Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  height: 80,
                  width: 80,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(urlLogo),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  logoName,
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      fontFamily: controller.fontData),
                ),
              ),
              const Expanded(
                flex: 1,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Future<void> _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw 'Could not launch $_url';
    }
  }

  Future<void> _launchInWebViewOrVC(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
