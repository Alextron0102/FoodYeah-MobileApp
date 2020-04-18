import 'package:flutter/material.dart';
import 'package:foodyeah/Resources/Pages/landingPage.dart';
import 'package:foodyeah/Resources/Pages/loginPage.dart';
import 'package:foodyeah/Resources/Pages/restTestPage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(//MaterialApp hace rutas entre pantallas
      title: 'Food Yeah',
      initialRoute: LoginPage.name,
      routes:{
        LandingPage.name:(BuildContext context) => LandingPage(),
        LoginPage.name:(BuildContext context) => LoginPage(),
        RestTestPage.name:(BuildContext context) => RestTestPage(),
      },
    );
  }
}
