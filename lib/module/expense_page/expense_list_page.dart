import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class ExpenseListPage extends StatefulWidget {
  const ExpenseListPage({super.key});

  @override
  State<ExpenseListPage> createState() => _ExpenseListPageState();
}

class _ExpenseListPageState extends State<ExpenseListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.purple,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: const Text(
                            "Report",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )),
                  ],
                ),
              ),
              searchBox(),
              Expanded(
                  child: ListView(
                children: [
                  
                ],
              ))
            ],
          )),
        ],
      ),
    );
  }

  Widget searchBox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: const TextField(
        // onChanged: ((value) => _runFilter(value)),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
            border: InputBorder.none,
            hintText: 'Search report...',
            hintStyle: TextStyle(
              color: Colors.grey,
            )),
      ),
    );
  }
}
