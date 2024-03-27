import 'package:flutter/material.dart';
import '../view/uk_dashboard4_view.dart';

class UkDashboard4Controller extends State<UkDashboard4View> {
  static late UkDashboard4Controller instance;
  late UkDashboard4View view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List users = [
    {
      "name": "Jessica",
      "photo":
          "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80",
    },
    {
      "name": "Tamara",
      "photo":
          "https://images.unsplash.com/photo-1485875437342-9b39470b3d95?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=873&q=80",
    },
    {
      "name": "Marie",
      "photo":
          "https://images.unsplash.com/photo-1588516903720-8ceb67f9ef84?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=444&q=80",
    },
    {
      "name": "Marco",
      "photo":
          "https://images.unsplash.com/photo-1560087637-bf797bc7796a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
    },
    {
      "name": "Atilla",
      "photo":
          "https://images.unsplash.com/photo-1602442787305-decbd65be507?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
    },
  ];

  List<Map<String, dynamic>> usersStatus = [
    {
      "name": "Jessica",
      "photo":
          "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80",
      "likes": 144000,
      "comments": 68,
      "message": "Hello, everyone! I'm having a great time today!",
    },
    {
      "name": "Tamara",
      "photo":
          "https://images.unsplash.com/photo-1485875437342-9b39470b3d95?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=873&q=80",
      "likes": 52000,
      "comments": 22,
      "message": "Feeling blessed today! 🌟",
    },
    {
      "name": "Marie",
      "photo":
          "https://images.unsplash.com/photo-1588516903720-8ceb67f9ef84?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=444&q=80",
      "likes": 32000,
      "comments": 45,
      "message": "Enjoying this beautiful weather! ☀️",
    },
    {
      "name": "Marco",
      "photo":
          "https://images.unsplash.com/photo-1560087637-bf797bc7796a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
      "likes": 88000,
      "comments": 120,
      "message": "Feeling excited about the new project! 🚀",
    },
    {
      "name": "Atilla",
      "photo":
          "https://images.unsplash.com/photo-1602442787305-decbd65be507?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
      "likes": 45000,
      "comments": 35,
      "message": "Feeling grateful for the little things. ❤️",
    },
  ];

  String formatNumberToK(int number) {
    if (number >= 1000) {
      double num = number / 1000;
      return '${num.toStringAsFixed(num.truncateToDouble() == num ? 0 : 1)}k';
    } else {
      return number.toString();
    }
  }
}
