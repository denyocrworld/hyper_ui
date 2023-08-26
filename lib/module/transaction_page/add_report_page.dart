import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../core.dart';

class AddReportPage extends StatefulWidget {
  const AddReportPage({super.key});

  @override
  State<AddReportPage> createState() => _AddReportPageState();
}

class _AddReportPageState extends State<AddReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Details",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              Text(
                "Report Details",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              QTextField(
                label: "Report Name",
                validator: Validator.required,
                hint: "Type report name",
                onChanged: (value) {},
              ),
              SizedBox(
                height: 15,
              ),
              QTextField(
                label: "Refering Name",
                validator: Validator.required,
                hint: "Type Refering name",
                onChanged: (value) {},
              ),
              SizedBox(
                height: 15,
              ),
              QTextField(
                label: "University",
                validator: Validator.required,
                hint: "Select University",
                onChanged: (value) {},
              ),
              SizedBox(
                height: 15,
              ),
              QTextField(
                label: "Major",
                validator: Validator.required,
                hint: "Type major name",
                onChanged: (value) {},
              ),
              SizedBox(
                height: 15,
              ),
              QTextField(
                label: "Year of Study",
                validator: Validator.required,
                hint: "Type year of study",
                onChanged: (value) {},
              ),
              SizedBox(
                height: 15,
              ),
              QTextField(
                label: "Description",
                validator: Validator.required,
                hint: "Type description issue",
                onChanged: (value) {},
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF9B51E0),
                  ),
                  onPressed: () {},
                  child: const Text("Request Report "),
                ),
              ),
            ],
          ),
        ));
  }
}
