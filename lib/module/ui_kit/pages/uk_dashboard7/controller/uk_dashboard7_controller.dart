import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/uk_dashboard7_view.dart';

class UkDashboard7Controller extends State<UkDashboard7View> {
  static late UkDashboard7Controller instance;
  late UkDashboard7View view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List<String> categories = [
    "Nearby",
    "Trending",
    "New",
  ];

  int selectedIndex = 0;
  updateIndex(int newIndex) {
    selectedIndex = newIndex;
    vendors.shuffle();
    setState(() {});
  }

  List<Map<String, dynamic>> vendors = [
    {
      "id": 1,
      "photo":
          "https://plus.unsplash.com/premium_photo-1661381038438-a1eb0348be72?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80F",
      "vendor_name": "Jhonny's Cut",
      "price": 29,
      "category": "Men",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "is_favorite": false,
      "rating": 4.3,
    },
    {
      "id": 2,
      "photo":
          "https://images.unsplash.com/photo-1536520002442-39764a41e987?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
      "vendor_name": "Andrea's Cut",
      "price": 31,
      "category": "Men",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "is_favorite": false,
      "rating": 4.8,
    },
    {
      "id": 3,
      "photo":
          "https://images.unsplash.com/photo-1525721092877-3c3c93bfa6d4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
      "vendor_name": "Alexa Barbershop",
      "price": 89,
      "category": "Men",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "is_favorite": false,
      "rating": 4.7,
    },
    {
      "id": 4,
      "photo":
          "https://images.unsplash.com/photo-1592647420148-bfcc177e2117?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2039&q=80",
      "vendor_name": "Jessica's Cut",
      "price": 66,
      "category": "Women",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "is_favorite": false,
      "rating": 4.9,
    },
    {
      "id": 5,
      "photo":
          "https://images.unsplash.com/photo-1516470930795-6ba2564824aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2069&q=80",
      "vendor_name": "Hotman's Cut",
      "price": 33,
      "category": "Men",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "is_favorite": false,
      "rating": 5.0,
    },
    {
      "id": 6,
      "photo":
          "https://images.unsplash.com/photo-1582771498000-8ad44e6c84db?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
      "vendor_name": "Simple cut",
      "price": 45,
      "category": "Women",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "is_favorite": false,
      "rating": 4.9,
    },
  ];
}
