import 'package:flutter/material.dart';
import 'package:fruits/controller/product_controller.dart';
import 'package:fruits/model/fruit_model.dart';
import 'package:fruits/model/order_model.dart';
import 'package:fruits/model/user_model.dart';
import 'package:fruits/screen/detailproduct_card_screen.dart';
import 'package:fruits/screen/payment_screen.dart';
import 'package:get/get.dart';

import '../controller/change_fonts_controller.dart';

ProductGetXController productGetXController = Get.put(ProductGetXController());
FontsController fontsController = Get.put(FontsController());

class ShoppingCardScreen extends StatefulWidget {
  const ShoppingCardScreen({super.key});

  @override
  State<ShoppingCardScreen> createState() => _ShoppingCardScreenState();
}

class _ShoppingCardScreenState extends State<ShoppingCardScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontsController>(builder: (controler) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Shopping Card',
            style: TextStyle(
                fontSize: 28,
                fontFamily: fontsController.fontData,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: GetBuilder<ProductGetXController>(
          builder: (controller) {
            return productGetXController.list.isEmpty
                ? const Center(
                    child: Icon(
                      Icons.shopping_cart_sharp,
                      size: 120,
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.list.length,
                    itemBuilder: (context, index) {
                      var pro = controller.list[index];
                      return productCardWidget(pro);
                    },
                  );
          },
        ),
        bottomSheet: GetBuilder<ProductGetXController>(
            init: productGetXController,
            builder: (contexts) {
              return Container(
                height: 120,
                width: double.infinity,
                color: Colors.blueAccent,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        color: Colors.blueAccent,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 40,
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Total',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: fontsController.fontData),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                ':',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: fontsController.fontData),
                              ),
                            ),
                            contexts.list.isEmpty
                                ? Text(
                                    '0.0\$',
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: fontsController.fontData),
                                  )
                                : contexts.calculateGrandTotal() == null
                                    ? Text(
                                        '0.0\$',
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                fontsController.fontData),
                                      )
                                    : Expanded(
                                        child: Text(
                                          '${contexts.grandTotal.toString()}\$',
                                          style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  fontsController.fontData),
                                        ),
                                      ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 4,
                      color: Colors.black,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 600),
                                pageBuilder: (context, animation, _) =>
                                    FadeTransition(
                                  opacity: animation,
                                  child: PaymentScreen(
                                      orderModel: OrderModel(
                                          orderId: DateTime.now()
                                              .millisecondsSinceEpoch,
                                          user: listUserInfo[0],
                                          listProduct:
                                              productGetXController.list)),
                                ),
                              ));
                        },
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          color: Colors.blueAccent,
                          child: Center(
                            child: Text(
                              'Order',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: fontsController.fontData),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      );
    });
  }

  Widget productCardWidget(FruitModel fruitModel) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 600),
              pageBuilder: (context, animation, _) => FadeTransition(
                opacity: animation,
                child: DetailProductCardScreen(
                    fruitModel: fruitModel, nextScreen: false),
              ),
            ));
      },
      child: Container(
        height: 100,
        //  color: Colors.blue,
        margin: const EdgeInsets.all(4),
        width: double.infinity,
        child: Hero(
          tag: 'showDetail${fruitModel.code}',
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Center(
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    leading: const SizedBox(width: 120),
                    title: Text(
                      fruitModel.name,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: fontsController.fontData),
                    ),
                    subtitle: Text(
                      'Weight:${fruitModel.weight} x ${fruitModel.qty}(g)',
                      style: TextStyle(fontFamily: fontsController.fontData),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${fruitModel.price}\$/kg',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontFamily: fontsController.fontData),
                        ),
                        Text(
                          '${fruitModel.total().toStringAsFixed(2)}\$',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontFamily: fontsController.fontData),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: const Color.fromARGB(255, 148, 133, 133),
                    ),
                    shape: BoxShape.circle,
                    color: Colors.red,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          AssetImage('assets/images/${fruitModel.fruitImage}'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
