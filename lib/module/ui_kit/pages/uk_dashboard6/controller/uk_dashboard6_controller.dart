import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/uk_dashboard6_view.dart';

class UkDashboard6Controller extends State<UkDashboard6View> {
  static late UkDashboard6Controller instance;
  late UkDashboard6View view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List<String> filters = ["Weekly", "Monthly", "All-time"];
  int selectedIndex = 0;
  updateIndex(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
  }

  List userStats = [
    {
      "label": "AVG WORKOUT TIME",
      "value": "26:32",
      "unit": "Min",
    },
    {
      "label": "AVG WORKOUT TIME",
      "value": "982",
      "unit": "Kcal",
    },
    {
      "label": "STEPS TAKEN",
      "value": "4456",
      "unit": "Steps",
    },
    {
      "label": "AVG CALORIES EATEN",
      "value": "2334",
      "unit": "Kcal",
    },
    {
      "label": "AVG SPEED",
      "value": "16",
      "unit": "mpb",
    },
    {
      "label": "AVG HEART RATES",
      "value": "90",
      "unit": "bpm",
    }
  ];
}
