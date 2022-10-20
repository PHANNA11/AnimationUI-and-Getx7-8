import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruits/controller/change_fonts_controller.dart';
import 'package:fruits/model/order_model.dart';
import 'package:get/get.dart';

FontsController fontsController = Get.find();

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key, required this.orderModel});
  OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Order',
          style: TextStyle(fontSize: 28, fontFamily: fontsController.fontData),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            // color: Colors.blue,
            child: ListView.builder(
              itemCount: orderModel.listProduct.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(4),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.red),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/${orderModel.listProduct[index].fruitImage}'))),
                );
              },
            ),
          ),
        ],
      ),
      bottomSheet: GestureDetector(
        onTap: () {},
        child: Container(
          height: 70,
          width: double.infinity,
          color: Colors.blueAccent,
          child: Center(
            child: Text(
              'Pay',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: fontsController.fontData),
            ),
          ),
        ),
      ),
    );
  }
}
