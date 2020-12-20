import 'package:flutter/material.dart';
import 'package:imvula/ui/pages/lead_accept_page.dart';
import 'package:imvula/ui/pages/pages.dart';
import 'package:imvula/ui/res/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: primaryColor),
      home: SplashPage(),
    );
  }
}
