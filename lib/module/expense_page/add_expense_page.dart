import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/shared/util/validator/validator.dart';
import 'package:hyper_ui/shared/widget/form/date_picker/datepicker.dart';
import 'package:hyper_ui/shared/widget/form/textfield/text_field.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            "Add New Expense",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "Expense Details",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            QTextField(
              label: "Expense Name",
              validator: Validator.required,
              hint: "Type expense name",
              onChanged: (value) {},
            ),
            SizedBox(
              height: 15,
            ),
            QTextField(
              label: "Category",
              validator: Validator.required,
              hint: "Select category",
              onChanged: (value) {},
            ),
            SizedBox(
              height: 15,
            ),
            QTextField(
              label: "Item Name",
              validator: Validator.required,
              hint: "Type item name",
              onChanged: (value) {},
            ),
            SizedBox(
              height: 15,
            ),
            QDatePicker(
              label: "Date",
              validator: Validator.required,
              onChanged: (value) {
                print("value: $value");
              },
            ),
            SizedBox(
              height: 15,
            ),
            QTextField(
              label: "Amount",
              validator: Validator.required,
              hint: "Type amount of expense",
              onChanged: (value) {},
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Upload Attachment",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: 100,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () async {},
                    child: Text(
                      "Upload Image (Max 5 MB)",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
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
                child: const Text("Request Expense"),
              ),
            ),
          ],
        ));
  }
}
