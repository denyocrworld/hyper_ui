import 'package:hyper_ui/core.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/module/login_form/view/login_form_view.dart';
import 'package:hyper_ui/module/transaction_page/add_report_page.dart';
import 'package:hyper_ui/module/transaction_page/report_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runMainApp();
}

runMainApp() async {
  return runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capek Ngoding',
      // navigatorKey: Get.navigatorKey,3
      debugShowCheckedModeBanner: false,
      // theme: getDefaultTheme(),
      home: AddReportPage(),
    );
  }
}
