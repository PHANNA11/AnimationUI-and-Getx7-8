import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fruits/controller/change_fonts_controller.dart';
import 'package:fruits/controller/product_controller.dart';
import 'package:fruits/model/fruit_model.dart';
import 'package:fruits/model/user_model.dart';
import 'package:fruits/screen/detailproduct_card_screen.dart';
import 'package:fruits/screen/shopping_card_screen.dart';
import 'package:fruits/screen/user_profile_screen.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool lg = false;
  ProductGetXController productGetXController =
      Get.put(ProductGetXController());
  FontsController fontsController = Get.put(FontsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontsController>(
        init: fontsController,
        builder: (context) {
          return Scaffold(
            drawer: UserProfile(user: listUserInfo[0]),
            appBar: AppBar(
              title: Text(
                widget.title,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: fontsController.fontData),
              ),
            ),
            body: GetBuilder<ProductGetXController>(builder: (context) {
              return ListView.builder(
                itemCount: getListData.length,
                itemBuilder: ((context, index) {
                  return Slidable(
                    key: const ValueKey(0),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (value) async {
                            productGetXController
                                .addProductCard(getListData[index]);
                          },
                          backgroundColor: const Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: Icons.add_shopping_cart,
                          label: 'add'.tr,
                        ),
                      ],
                    ),
                    child: productCardWidget(getListData[index]),
                  );
                }),
              );
            }),
            floatingActionButton: GetBuilder<ProductGetXController>(
                init: productGetXController,
                builder: (context) {
                  return productGetXController.list.isEmpty
                      ? const SizedBox()
                      : Badge(
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
                              size: 40,
                            ),
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
                    fruitModel: fruitModel, nextScreen: true),
              ),
            ));
      },
      child: Container(
        height: 100,
        //  color: Colors.blue,
        margin: const EdgeInsets.all(4),
        width: double.infinity,
        child: Hero(
          tag: '${fruitModel.code}',
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
                      'Weight:${fruitModel.weight} g',
                      style: TextStyle(fontFamily: fontsController.fontData),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${fruitModel.price}\$/Kg',
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
                        color: const Color.fromARGB(255, 148, 133, 133)),
                    shape: BoxShape.circle,
                    color: Colors.red,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/images/${fruitModel.fruitImage}'))),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
