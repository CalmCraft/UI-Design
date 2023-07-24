import 'package:flutter/material.dart';
import 'package:ui_design/travel/travel_page.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "SansSemi"),
      home: const TravelPage(),
    );
  }
}
