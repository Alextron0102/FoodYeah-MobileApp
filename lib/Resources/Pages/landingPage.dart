import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  static final name = "/LandingPage";
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/landing/backgr4.jpg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
                child: Row(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width / 40,
                    0,
                    MediaQuery.of(context).size.width / 40,
                    0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "FoodYeah!",
                        style: TextStyle(
                          fontFamily: 'Solano',
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height / 40),
                      Text(
                        "Adiós filas... ¡Hola comida!\n ",
                        style: TextStyle(
                          fontFamily: 'Zisou',
                          fontSize: 35,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        "Evita hacer filas y compra tu menú universitario desde la app. ¡Pruébalo!",
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 20,
                          color: Colors.white,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        " ",
                        style: TextStyle(
                          height: 1,
                        ),
                      ),
                      Text(
                        "Presenta una solución a la crisis que presenta el COVID-19 virtualizando el proceso de compra y así evitando el contacto físico",
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 20,
                          color: Colors.white,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        " ",
                        style: TextStyle(
                          height: 1,
                        ),
                      ),
                      Text(
                        "Una experiencia de compra rápida y sencilla, tanto como físicamente y virtualmente",
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 20,
                          color: Colors.white,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height / 40),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              side: BorderSide(color: Colors.white),
                            ),
                            textColor: Colors.white,
                            splashColor: Colors.grey,
                            color: Colors.black,
                            padding: const EdgeInsets.fromLTRB(30.0, 10, 30.0,
                                10), //Definir que tan grande es el boton
                            child: Row(children: <Widget>[
                              Text(
                                'GooglePlay',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Solano',
                                  fontSize: 25,
                                ),
                              ),
                            ]),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 40),
                          FlatButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              side: BorderSide(color: Colors.white),
                            ),
                            textColor: Colors.white,
                            splashColor: Colors.grey,
                            color: Colors.black,
                            padding: const EdgeInsets.fromLTRB(40.0, 10, 40.0,
                                10), //Definir que tan grande es el boton
                            child: Text(
                              'App Store',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Solano',
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 40),
                          FlatButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              side: BorderSide(color: Colors.white),
                            ),
                            textColor: Colors.white,
                            splashColor: Colors.grey,
                            color: Colors.black,
                            padding: const EdgeInsets.fromLTRB(30.0, 10, 30.0,
                                10), //Definir que tan grande es el boton
                            child: Row(children: <Widget>[
                              Text(
                                '       PC       ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Solano',
                                  fontSize: 25,
                                ),
                              ),
                            ]),
                          ),
                        ],
                      )
                    ]),
                width: MediaQuery.of(context).size.width / 2.3,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width / 40,
                    0,
                    MediaQuery.of(context).size.width / 40,
                    0),
                child: Image.asset(
                  'assets/images/landing/platforms.png',
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ),
            ]))),
      ],
    );
  }
}
