import 'package:flutter/material.dart';

import '../view/login_form_view.dart';

class LoginFormController extends State<LoginFormView> {
  static late LoginFormController instance;
  late LoginFormView view;

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
