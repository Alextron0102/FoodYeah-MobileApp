import 'package:flutter/material.dart';
import 'package:foodyeah/Resources/Pages/landingPage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Yeah',
      initialRoute: LandingPage.name,
      routes:{
        LandingPage.name:(BuildContext context) => LandingPage(),
      },
    );
  }
}
