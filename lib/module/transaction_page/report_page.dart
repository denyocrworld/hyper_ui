import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hyper_ui/module/transaction_page/add_report_page.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
              // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                  reportItem(),
                  reportItem(),
                  reportItem(),
                  reportItem(),
                  reportItem(),
                  reportItem(),
                  reportItem(),
                  reportItem(),
                  reportItem(),
                  reportItem()
                ],
              ))
            ],
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 50,
                  margin: const EdgeInsets.only(
                    bottom: 30,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                        builder: (context) => AddReportPage(),
                      ))
                          .then((value) {
                        setState(() {});
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,

                      // minimumSize: const Size(120, 60),
                      elevation: 10,
                    ),
                    child: const Text(
                      'Add new report',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding reportItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 2,
        child: ListTile(
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.edit),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.delete)
            ],
          ),
          title: const Text("Report pelanggaran KIP-K 1"),
        ),
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
