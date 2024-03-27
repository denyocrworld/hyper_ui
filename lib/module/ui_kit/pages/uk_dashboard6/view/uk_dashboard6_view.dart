import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class UkDashboard6View extends StatefulWidget {
  UkDashboard6View({Key? key}) : super(key: key);

  Widget build(context, UkDashboard6Controller controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Analytics"),
        leading: Container(),
        leadingWidth: 0.0,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.close,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                top: 12.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 24,
                    offset: Offset(0, 11),
                  ),
                ],
              ),
              child: Row(
                  children: List.generate(
                controller.filters.length,
                (index) {
                  var item = controller.filters[index];
                  bool selected = controller.selectedIndex == index;
                  return Expanded(
                    child: InkWell(
                      onTap: () => controller.updateIndex(index),
                      child: Column(
                        children: [
                          Text(
                            item,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: selected ? infoColor : null,
                            ),
                          ),
                          Container(
                            height: 12,
                            width: 32,
                            decoration: const BoxDecoration(),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: -22,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Transform.scale(
                                    scaleX: 3.8,
                                    child: Icon(
                                      MdiIcons.triangle,
                                      size: 32.0,
                                      color: selected
                                          ? infoColor
                                          : Colors.transparent,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Builder(
              builder: (context) {
                final List<Map> chartData = [
                  {
                    "year": 2018,
                    "sales": 40,
                  },
                  {
                    "year": 2019,
                    "sales": 50,
                  },
                  {
                    "year": 2020,
                    "sales": 30,
                  },
                  {
                    "year": 2021,
                    "sales": 60,
                  },
                  {
                    "year": 2022,
                    "sales": 40,
                  },
                  {
                    "year": 2023,
                    "sales": 90,
                  },
                  {
                    "year": 2024,
                    "sales": 30,
                  }
                ];

                return Container(
                  height: 200.0,
                  color: Theme.of(context).cardColor,
                  padding: EdgeInsets.all(12.0),
                  child: SfCartesianChart(
                    primaryYAxis: NumericAxis(
                      opposedPosition: true,
                    ),
                    series: <CartesianSeries>[
                      AreaSeries<Map, int>(
                        borderWidth: 2.0,
                        borderColor: infoColor,
                        color: infoColor.withOpacity(0.4),
                        dataSource: chartData,
                        xValueMapper: (Map data, _) => data["year"],
                        yValueMapper: (Map data, _) => data["sales"],
                      )
                    ],
                  ),
                );
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Stats",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: infoColor,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.0 / 0.5,
                      crossAxisCount: 2,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                    ),
                    itemCount: controller.userStats.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.userStats[index];
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${item["label"]}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(
                              height: 4.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${item["value"]}",
                                  style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  "${item["unit"]}",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<UkDashboard6View> createState() => UkDashboard6Controller();
}
