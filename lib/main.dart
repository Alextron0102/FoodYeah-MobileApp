import 'package:flutter/material.dart';
// import 'package:foodyeah/Resources/Pages/homePage.dart';
// import 'package:foodyeah/Resources/Pages/loginPage.dart';
// import 'package:foodyeah/Resources/Pages/restTestPage.dart';
import 'package:foodyeah/Resources/Pages/landingPage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(//MaterialApp hace rutas entre pantallas
      title: 'Food Yeah',
      //initialRoute: LandingPage.name,
      home: LandingPage(),
      routes:{
        //HomePage.name:(BuildContext context) => HomePage(),
        //LoginPage.name:(BuildContext context) => LoginPage(),
        //RestTestPage.name:(BuildContext context) => RestTestPage(),
        LandingPage.name:(BuildContext context) => LandingPage(),
      },
    );
  }
}
