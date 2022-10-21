import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruits/controller/change_fonts_controller.dart';
import 'package:get/get.dart';

FontsController fontsController = Get.put(FontsController());

class TextFieldCard extends StatelessWidget {
  TextFieldCard(
      {super.key,
      this.label,
      this.controller,
      this.sHintext,
      required this.readOnly});
  TextEditingController? controller;
  String? label;
  String? sHintext;
  bool readOnly;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontsController>(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          textAlign: TextAlign.center,
          controller: controller!,
          style: TextStyle(fontFamily: fontsController.fontData, fontSize: 20),
          readOnly: readOnly,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: sHintext!,
              label: Text(
                label!,
                style: TextStyle(
                    fontFamily: fontsController.fontData, fontSize: 26),
              ),
              floatingLabelAlignment: FloatingLabelAlignment.center),
        ),
      );
    });
  }
}
