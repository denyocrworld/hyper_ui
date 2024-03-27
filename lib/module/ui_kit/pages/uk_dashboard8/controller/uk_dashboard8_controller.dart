import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/uk_dashboard8_view.dart';

class UkDashboard8Controller extends State<UkDashboard8View> {
  static late UkDashboard8Controller instance;
  late UkDashboard8View view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List places = [
    {
      "photo": "https://picsum.photos/1000",
      "name": "Ubud Villa",
      "rating": 4.6,
      "price": 248,
      "location": "Bali, Indonesia",
    },
    {
      "photo": "https://picsum.photos/1001",
      "name": "Maldives Beach Resort",
      "rating": 4.8,
      "price": 599,
      "location": "Maldives",
    },
    {
      "photo": "https://picsum.photos/1002",
      "name": "Parisian Getaway",
      "rating": 4.4,
      "price": 799,
      "location": "Paris, France",
    },
    {
      "photo": "https://picsum.photos/1003",
      "name": "Tokyo Tower View",
      "rating": 4.7,
      "price": 499,
      "location": "Tokyo, Japan",
    },
    {
      "photo": "https://picsum.photos/1004",
      "name": "New York City Loft",
      "rating": 4.5,
      "price": 799,
      "location": "New York, USA",
    },
    {
      "photo": "https://picsum.photos/1005",
      "name": "Santorini Sunset Villa",
      "rating": 4.9,
      "price": 699,
      "location": "Santorini, Greece",
    },
    {
      "photo": "https://picsum.photos/1006",
      "name": "Rome Colosseum View",
      "rating": 4.6,
      "price": 699,
      "location": "Rome, Italy",
    },
    {
      "photo": "https://picsum.photos/1007",
      "name": "Sydney Harbour Suite",
      "rating": 4.8,
      "price": 549,
      "location": "Sydney, Australia",
    },
    {
      "photo": "https://picsum.photos/1008",
      "name": "Cape Town Retreat",
      "rating": 4.7,
      "price": 499,
      "location": "Cape Town, South Africa",
    },
    {
      "photo": "https://picsum.photos/1009",
      "name": "Machu Picchu Lodge",
      "rating": 4.9,
      "price": 699,
      "location": "Machu Picchu, Peru",
    },
  ];

  List recommendedPlaces = [
    {
      "photo": "https://picsum.photos/1010",
      "name": "Miami Beachfront Villa",
      "rating": 4.7,
      "price": 899,
      "location": "Miami, USA",
    },
    {
      "photo": "https://picsum.photos/1011",
      "name": "Barcelona Apartment",
      "rating": 4.6,
      "price": 649,
      "location": "Barcelona, Spain",
    },
    {
      "photo": "https://picsum.photos/1012",
      "name": "London Townhouse",
      "rating": 4.5,
      "price": 799,
      "location": "London, UK",
    },
    {
      "photo": "https://picsum.photos/1013",
      "name": "Dubai Luxury Resort",
      "rating": 4.9,
      "price": 1199,
      "location": "Dubai, UAE",
    },
    {
      "photo": "https://picsum.photos/1014",
      "name": "Rio de Janeiro Beach View",
      "rating": 4.8,
      "price": 699,
      "location": "Rio de Janeiro, Brazil",
    },
    {
      "photo": "https://picsum.photos/1015",
      "name": "Auckland Lakeside Retreat",
      "rating": 4.7,
      "price": 549,
      "location": "Auckland, New Zealand",
    },
  ];

  List menus = [
    {
      "icon": Icons.villa,
      "label": "History",
    },
    {
      "icon": Icons.airplane_ticket,
      "label": "Ticket",
    },
    {
      "icon": Icons.hotel,
      "label": "Hotels",
    },
    {
      "icon": Icons.more_horiz,
      "label": "More",
    }
  ];
}
