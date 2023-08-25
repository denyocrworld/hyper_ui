// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../../core.dart';
import '../controller/sign_up_controller.dart';

class SignUpFormView extends StatefulWidget {
  const SignUpFormView({Key? key}) : super(key: key);

  Widget build(context, SignUpFormController controller) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF9B51E0),
          title: const Text("SignUp Form"),
          actions: [],
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              Text("User Detail"),
              SizedBox(
                height: 15,
              ),
              QTextField(
                label: "Name",
                validator: Validator.required,
                value: "John Doe",
                onChanged: (value) {},
              ),
              SizedBox(
                height: 15,
              ),
              QTextField(
                label: "Email",
                validator: Validator.email,
                suffixIcon: Icons.email,
                value: "demo@gmail.com",
                onChanged: (value) {},
              ),
              SizedBox(
                height: 15,
              ),
              QNumberField(
                label: "Age",
                validator: Validator.required,
                value: "24",
                onChanged: (value) {},
              ),
              SizedBox(
                height: 15,
              ),
              QTextField(
                label: "Name",
                validator: Validator.required,
                value: "John Doe",
                onChanged: (value) {},
              ),
              SizedBox(
                height: 15,
              ),
              QTextField(
                label: "Name",
                validator: Validator.required,
                value: "John Doe",
                onChanged: (value) {},
              ),
              SizedBox(
                height: 15,
              ),
              QTextField(
                label: "Password",
                obscure: true,
                validator: Validator.required,
                suffixIcon: Icons.password,
                value: "123456",
                onChanged: (value) {},
              ),
              SizedBox(
                height: 15,
              ),
              QTextField(
                label: "Password",
                obscure: true,
                validator: Validator.required,
                suffixIcon: Icons.password,
                value: "123456",
                onChanged: (value) {},
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9B51E0),
                ),
                onPressed: () {},
                child: const Text("Sign Up"),
              ),
            ],
          ),
        ));
  }

  @override
  State<SignUpFormView> createState() => SignUpFormController();
}
