import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';

import '../controller/change_fonts_controller.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<Map<String, dynamic>> listTopsell = [
    {
      'number': 20.0,
      'name': "passion",
      'color': Colors.red,
      'image': 'assets/images/passion.png'
    },
    {
      'number': 10.0,
      'name': "Apple",
      'color': Colors.blue,
      'image': 'assets/images/apple.png'
    },
    {
      'number': 23.0,
      'name': "Mango",
      'color': Colors.purple,
      'image': 'assets/images/star_fruit.png'
    },
    {
      'number': 5.0,
      'name': "PAPAYA",
      'color': Colors.yellow,
      'image': 'assets/images/papaya.png'
    }
  ];

  List<Map<String, dynamic>> listDataChart = [
    {
      'number': 20.0,
      'name': "passion",
      'color': Colors.red,
      'image': 'assets/images/passion.png'
    },
    {
      'number': 10.0,
      'name': "Apple",
      'color': Colors.blue,
      'image': 'assets/images/apple.png'
    },
    {
      'number': 23.0,
      'name': "Mango",
      'color': Colors.purple,
      'image': 'assets/images/star_fruit.png'
    },
    {
      'number': 5.0,
      'name': "PAPAYA",
      'color': Colors.yellow,
      'image': 'assets/images/papaya.png'
    }
  ];

  FontsController fontsController = Get.put(FontsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontsController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'dashboard'.tr,
            style: TextStyle(
              fontFamily: fontsController.fontData,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'top_sell'.tr,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: fontsController.fontData),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    ImageSlideshow(
                      initialPage: 0,
                      isLoop: true,
                      autoPlayInterval: 3500,
                      //width: 300,
                      height: 190,
                      children: List.generate(
                        listTopsell.length,
                        (index) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage(listTopsell[index]['image']))),
                        ),
                      ),
                    ),
                    Positioned(
                        child: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        //color: Colors.red,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/top_sell.jpeg'),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'sell_chart'.tr,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: fontsController.fontData),
                    ),
                  ),
                  SizedBox(
                    height: 260,
                    child: PieChart(
                      swapAnimationDuration: const Duration(seconds: 2),
                      PieChartData(
                        startDegreeOffset: 20,
                        sectionsSpace: 1,
                        centerSpaceColor:
                            const Color.fromARGB(255, 104, 89, 111),
                        sections: List.generate(
                          listDataChart.length,
                          (index) => PieChartSectionData(
                            color: listDataChart[index]['color'],
                            showTitle: true,
                            badgePositionPercentageOffset: 0.9,
                            titlePositionPercentageOffset: 0.35,
                            badgeWidget: SizedBox(
                                height: 50,
                                width: 50,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      listDataChart[index]['image'].toString()),
                                )),
                            titleStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: fontsController.fontData),
                            title: '${listDataChart[index]['name']}',
                            radius: 100,
                            value: listDataChart[index]['number'],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(listDataChart.length, (index) {
                    return Column(children: [
                      Container(
                        height: 40,
                        width: 40,
                        color: listDataChart[index]['color'],
                      ),
                      Text(
                        listDataChart[index]['name'],
                        style: TextStyle(fontFamily: fontsController.fontData),
                      ),
                      Text(
                        listDataChart[index]['number'].toString(),
                        style: TextStyle(fontFamily: fontsController.fontData),
                      ),
                    ]);
                  }),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
