import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/uk_dashboard9_view.dart';

class UkDashboard9Controller extends State<UkDashboard9View> {
  static late UkDashboard9Controller instance;
  late UkDashboard9View view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List menuList = [
    {
      "label": "Restaurant",
      "icon": Icons.restaurant,
    },
    {
      "label": "Hotel",
      "icon": Icons.hotel,
    },
    {
      "label": "Shopping",
      "icon": Icons.shopping_bag,
    },
    {
      "label": "Hospital",
      "icon": Icons.local_hospital,
    },
    {
      "label": "School",
      "icon": Icons.school,
    }
  ];
  List places = [
    {
      "photo": "https://picsum.photos/1000",
      "name": "Ubud Villa",
      "rating": 4.6,
      "price": 248,
      "location": "Bali, Indonesia",
      "distance": 11,
    },
    {
      "photo": "https://picsum.photos/1001",
      "name": "Maldives Beach Resort",
      "rating": 4.8,
      "price": 599,
      "location": "Maldives",
      "distance": 13,
    },
    {
      "photo": "https://picsum.photos/1002",
      "name": "Parisian Getaway",
      "rating": 4.4,
      "price": 799,
      "location": "Paris, France",
      "distance": 25,
    },
    {
      "photo": "https://picsum.photos/1003",
      "name": "Tokyo Tower View",
      "rating": 4.7,
      "price": 499,
      "location": "Tokyo, Japan",
      "distance": 33,
    },
    {
      "photo": "https://picsum.photos/1004",
      "name": "New York City Loft",
      "rating": 4.5,
      "price": 799,
      "location": "New York, USA",
      "distance": 42,
    },
    {
      "photo": "https://picsum.photos/1005",
      "name": "Santorini Sunset Villa",
      "rating": 4.9,
      "price": 699,
      "location": "Santorini, Greece",
      "distance": 66,
    },
    {
      "photo": "https://picsum.photos/1006",
      "name": "Rome Colosseum View",
      "rating": 4.6,
      "price": 699,
      "location": "Rome, Italy",
      "distance": 87,
    },
    {
      "photo": "https://picsum.photos/1007",
      "name": "Sydney Harbour Suite",
      "rating": 4.8,
      "price": 549,
      "location": "Sydney, Australia",
      "distance": 633,
    },
    {
      "photo": "https://picsum.photos/1008",
      "name": "Cape Town Retreat",
      "rating": 4.7,
      "price": 499,
      "location": "Cape Town, South Africa",
      "distance": 32,
    },
    {
      "photo": "https://picsum.photos/1009",
      "name": "Machu Picchu Lodge",
      "rating": 4.9,
      "price": 699,
      "location": "Machu Picchu, Peru",
      "distance": 42,
    },
  ];

  bool isSlideUp = false;
  updateSlide(bool value) async {
    isSlideUp = value;
    setState(() {});
  }
}
