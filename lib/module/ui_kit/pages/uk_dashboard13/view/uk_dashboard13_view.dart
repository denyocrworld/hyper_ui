import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/uk_dashboard13_controller.dart';

final mainColor = Color(0xff1c2a2d);

class UkDashboard13View extends StatefulWidget {
  UkDashboard13View({Key? key}) : super(key: key);

  Widget build(context, UkDashboard13Controller controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Container(),
        leadingWidth: 0.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi Josh,",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Let's complete some tasks!",
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            width: 40,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0.0),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {},
              child: Center(
                child: Icon(
                  Icons.tune,
                  color: Colors.grey[900],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Dashboard13Statistic(
                    backgroundColor: Color(0xfff48fb1),
                    height: (MediaQuery.of(context).size.width * 0.6) + 12,
                    width: MediaQuery.of(context).size.width * 0.5,
                    label: "Task",
                    value: "36",
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Dashboard13Statistic(
                          backgroundColor: Color(0xfff4dd69),
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.5,
                          label: "Pending",
                          value: "41",
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Dashboard13Statistic(
                          backgroundColor: Color(0xffd2df90),
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.5,
                          label: "Done",
                          value: "120",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              H6(title: "Recently Updated"),
              SizedBox(
                height: 8.0,
              ),
              CustomCard(
                title: "Design a Dribbble shot",
                color: Color(0xffd2df8f),
              ),
              const SizedBox(
                height: 12.0,
              ),
              CustomCard(
                title: "POS App UI/UX in Figma",
                color: Color(0xfffaab8c),
              ),
              const SizedBox(
                height: 12.0,
              ),
              CustomCard(
                title: "Checkout Feature",
                color: Color(0xfff6df69),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<UkDashboard13View> createState() => UkDashboard13Controller();
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 2.0,
          color: mainColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              border: Border(
                bottom: BorderSide(
                  width: 2.0,
                  color: mainColor,
                ),
              ),
            ),
            child: Text(
              "$title",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      IconLabel(
                        icon: Icons.date_range,
                        label: "27 Feb",
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      IconLabel(
                        icon: Icons.list,
                        label: "10 Tasks",
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      IconLabel(
                        icon: Icons.people,
                        label: "8 Members",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: mainColor,
                        backgroundColor: color,
                        side: BorderSide(
                          color: mainColor,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("View"),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: mainColor,
                        backgroundColor: Color(0xffbdbdbd),
                        side: BorderSide(
                          color: mainColor,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Remind me"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IconLabel extends StatelessWidget {
  IconLabel({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DottedIcon(
          icon: icon,
          size: 14,
        ),
        SizedBox(
          width: 6.0,
        ),
        Text(
          "$label",
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}

class Dashboard13Statistic extends StatelessWidget {
  Dashboard13Statistic({
    super.key,
    required this.backgroundColor,
    required this.width,
    required this.height,
    required this.label,
    required this.value,
  });

  final Color backgroundColor;
  final double width;
  final double height;

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          width: 2.0,
          color: mainColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 10,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$value",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                  ),
                ),
                Text(
                  "$label",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: mainColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: DottedIcon(
              icon: Icons.file_copy_sharp,
            ),
          ),
        ],
      ),
    );
  }
}

class DottedIcon extends StatelessWidget {
  DottedIcon({
    super.key,
    required this.icon,
    this.size,
  });

  final IconData icon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 2,
      borderType: BorderType.RRect,
      color: mainColor,
      radius: Radius.circular(6),
      padding: EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Icon(
          icon,
          color: mainColor,
          size: size ?? 24.0,
        ),
      ),
    );
  }
}
