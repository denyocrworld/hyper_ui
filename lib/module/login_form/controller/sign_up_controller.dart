import 'package:flutter/material.dart';

import '../view/signup_form_view.dart';

class SignUpFormController extends State<SignUpFormView> {
  static late SignUpFormController instance;
  late SignUpFormView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
