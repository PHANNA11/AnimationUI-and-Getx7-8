import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruits/controller/change_fonts_controller.dart';
import 'package:fruits/controller/product_controller.dart';
import 'package:fruits/model/fruit_model.dart';
import 'package:fruits/screen/shopping_card_screen.dart';
import 'package:get/get.dart';

ProductGetXController productGetXController = Get.put(ProductGetXController());
FontsController fontsController = Get.put(FontsController());

class DetailProductCardScreen extends StatelessWidget {
  DetailProductCardScreen(
      {super.key, required this.fruitModel, required this.nextScreen});
  FruitModel fruitModel;
  bool nextScreen = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontsController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'about_product'.tr,
            style: TextStyle(
                fontSize: 27,
                fontFamily: fontsController.fontData,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            nextScreen
                ? GetBuilder<ProductGetXController>(
                    init: productGetXController,
                    builder: (context) {
                      return Badge(
                        position: const BadgePosition(
                          top: 0,
                          end: 2,
                        ),
                        badgeContent: Text(
                          productGetXController.list.length.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                        animationDuration: const Duration(milliseconds: 3000),
                        toAnimate: true,
                        animationType: BadgeAnimationType.slide,
                        child: IconButton(
                          onPressed: () {
                            Get.to(() => const ShoppingCardScreen());
                          },
                          icon: const Icon(
                            Icons.shopping_cart,
                            size: 34,
                          ),
                        ),
                      );
                    })
                : const SizedBox(),
            const SizedBox(
              width: 40,
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: 'showDetail${fruitModel.code}',
                child: Stack(
                  children: [
                    SizedBox(
                      height: 320,
                      width: double.infinity,
                      child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/background_image/${fruitModel.backgroundImages}')),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 30,
                      right: 30,
                      top: 10,
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 10, color: Colors.blueGrey),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                'assets/images/${fruitModel.fruitImage}'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 1),
              child: Text(
                fruitModel.name,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: fontsController.fontData),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${fruitModel.weight} g',
                style: TextStyle(
                    fontSize: 18, fontFamily: fontsController.fontData),
              ),
            ),
            GetBuilder<ProductGetXController>(
                init: productGetXController,
                builder: (context) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 178, 172, 172),
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FloatingActionButton(
                              backgroundColor:
                                  const Color.fromARGB(255, 178, 172, 172),
                              onPressed: () async {
                                productGetXController
                                            .list[productGetXController.list
                                                .indexWhere((element) =>
                                                    element.code ==
                                                    fruitModel.code)]
                                            .qty <=
                                        0
                                    ? Fluttertoast.showToast(
                                        msg: "product_not_have_qty".tr,
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0)
                                    : productGetXController
                                        .decrementQty(fruitModel);
                              },
                              heroTag: 'decrement',
                              child: const Icon(Icons.remove),
                            ),
                            productGetXController.list.isEmpty
                                ? Text(
                                    '0',
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: fontsController.fontData),
                                  )
                                : productGetXController.list.every((element) =>
                                        element.code != fruitModel.code)
                                    ? Text(
                                        '0',
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                fontsController.fontData),
                                      )
                                    : Text(
                                        context
                                            .list[productGetXController.list
                                                .indexWhere((element) =>
                                                    element.code ==
                                                    fruitModel.code)]
                                            .qty
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                fontsController.fontData),
                                      ),
                            FloatingActionButton(
                              heroTag: 'increment',
                              backgroundColor:
                                  const Color.fromARGB(255, 178, 172, 172),
                              onPressed: () async {
                                productGetXController.incrementQty(fruitModel);
                              },
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              '${fruitModel.price}\$/kg',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: fontsController.fontData),
                            ),
                            productGetXController.list.isEmpty
                                ? Text(
                                    '${fruitModel.total().toStringAsFixed(2)} \$',
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: fontsController.fontData),
                                  )
                                : productGetXController.list.every((element) =>
                                        element.code != fruitModel.code)
                                    ? Text(
                                        '${fruitModel.total().toStringAsFixed(2)} \$',
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                fontsController.fontData),
                                      )
                                    : Text(
                                        '${context.list[productGetXController.list.indexWhere((element) => element.code == fruitModel.code)].total().toStringAsFixed(2)} \$',
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                fontsController.fontData),
                                      ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'about_product'.tr,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: fontsController.fontData),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                fruitModel.description,
                style: TextStyle(
                    fontSize: 20, fontFamily: fontsController.fontData),
              ),
            ),
          ],
        ),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 154, 151, 151),
            onPressed: () {},
            heroTag: 'fav',
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            ),
          ),
          InkWell(
            onTap: () {
              productGetXController.addProductCard(fruitModel);
            },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'add_to_card'.tr,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: fontsController.fontData),
                ),
              ),
            ),
          ),
        ]),
      );
    });
  }
}
