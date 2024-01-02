import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oneinvest/screens/expense_report.dart';
import 'package:oneinvest/screens/home_page.dart';
import 'package:oneinvest/screens/summary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //calling home page
      home: HomePage(),
    );
  }
}
