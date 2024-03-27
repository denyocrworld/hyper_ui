import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/uk_form_view.dart';

class UkFormController extends State<UkFormView> {
  static late UkFormController instance;
  late UkFormView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
