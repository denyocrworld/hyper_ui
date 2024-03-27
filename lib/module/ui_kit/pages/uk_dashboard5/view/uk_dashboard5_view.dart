import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class UkDashboard5View extends StatefulWidget {
  UkDashboard5View({Key? key}) : super(key: key);

  Widget build(context, UkDashboard5Controller controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Dashboard",
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 48.0,
                      width: 48.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://i.ibb.co/PGv8ZzG/me.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: infoColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        8.0,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "January",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  "\$ 500",
                                  style: TextStyle(
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 100.0,
                            width: 100.0,
                            child: Builder(
                              builder: (context) {
                                final List<Map> chartData = [
                                  {
                                    "year": 2018,
                                    "sales": 40,
                                  },
                                  {
                                    "year": 2019,
                                    "sales": 90,
                                  },
                                  {
                                    "year": 2020,
                                    "sales": 30,
                                  },
                                  {
                                    "year": 2021,
                                    "sales": 80,
                                  },
                                  {
                                    "year": 2022,
                                    "sales": 90,
                                  }
                                ];

                                return Container(
                                  color: Colors.transparent,
                                  padding: const EdgeInsets.all(12.0),
                                  child: SfCartesianChart(
                                    primaryXAxis: NumericAxis(
                                      isVisible: false,
                                    ),
                                    primaryYAxis: NumericAxis(
                                      isVisible: false,
                                    ),
                                    plotAreaBorderColor: Colors.transparent,
                                    margin: EdgeInsets.all(0.0),
                                    series: <CartesianSeries>[
                                      SplineSeries<Map, int>(
                                        color: Colors.white,
                                        dataSource: chartData,
                                        xValueMapper: (Map data, _) =>
                                            data["year"],
                                        yValueMapper: (Map data, _) =>
                                            data["sales"],
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      LinearProgressIndicator(
                        color: Colors.white,
                        backgroundColor: Colors.white.withOpacity(0.4),
                        value: 0.6,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Daily spend target: \$16.67",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "DAILY SPENTS",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: infoColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                ListView.builder(
                  itemCount: controller.histories.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = controller.histories[index];
                    return Container(
                      margin: EdgeInsets.only(
                        bottom: 12.0,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: item["color"],
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  8.0,
                                ),
                              ),
                            ),
                            child: Icon(
                              item["icon"],
                              size: 24.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["label"],
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "${item["price"]}",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "${item["date"]}",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "WISHLIST",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: infoColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                SingleChildScrollView(
                  controller: ScrollController(),
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Row(
                    children:
                        List.generate(controller.histories.length, (index) {
                      var item = controller.histories[index];
                      return Container(
                        width: 64.0,
                        height: 64.0,
                        margin: const EdgeInsets.only(
                          right: 12.0,
                        ),
                        decoration: BoxDecoration(
                          color: item["color"],
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              8.0,
                            ),
                          ),
                        ),
                        child: Icon(
                          item["icon"],
                          size: 24.0,
                          color: Colors.white,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<UkDashboard5View> createState() => UkDashboard5Controller();
}
