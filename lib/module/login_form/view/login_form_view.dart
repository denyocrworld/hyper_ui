import 'package:flutter/material.dart';
import 'package:hyper_ui/module/login_form/view/signup_form_view.dart';

import '../../../core.dart';
import '../controller/login_form_controller.dart';

class LoginFormView extends StatefulWidget {
  const LoginFormView({Key? key}) : super(key: key);

  Widget build(context, LoginFormController controller) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("LogIn Form"),
          actions: const [],
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              Container(
                height: 250,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Image.asset(
                    "assets/aset/logo.png",
                    // width: 180,
                    // height: 180,
                    // fit: BoxFit.fill
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    QTextField(
                      label: "Email",
                      validator: Validator.email,
                      suffixIcon: Icons.email,
                      helper: "Masukkan Email Anda",
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    QTextField(
                      label: "Password",
                      helper: "Masukkan Password Anda",
                      obscure: true,
                      validator: Validator.required,
                      suffixIcon: Icons.remove_red_eye_outlined,
                      // isObscured: ob,
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      child: QButton(
                          label: "LogIn",
                          color: Color(0xFF9B51E0),
                          // onPressed: () => SignUpFormView(),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpFormView()),
                            );
                          }),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 150,
                      height: 50,
                      child: QButton(
                        label: "SignUp",
                        color: Color(0xFF9B51E0),
                        onPressed: () => SignUpFormView(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => {},
                      child: Text(
                        "Forgot your password?",
                        style:
                            TextStyle(color: Color(0xFF9B51E0), fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  @override
  State<LoginFormView> createState() => LoginFormController();
}
