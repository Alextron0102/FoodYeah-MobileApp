
import 'package:flutter/material.dart';
class LandingPage extends StatefulWidget {
  static final name="LandingPage";
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image(
                image: AssetImage('assets/images/logo/logowhite.png'),
                ),
              ),
            Center(
              child: Text(
                "USUARIO"
                ),
              ),
            Center(
              child: TextField(
              autocorrect: false,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder( 
                      borderRadius: BorderRadius.all(Radius.circular(1000.0)),
                      borderSide: BorderSide(color: Colors.black),
                      ),
                  fillColor: Colors.grey,
                  filled: true,
                  contentPadding:
                      EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                  hintText: 'texto de ejemplo'),
            ),
              ),
            Container( //vacio, espacio de separación:
              height: 50,
            ),
            Center(
              child: Text(
                "CONTRASEÑA"
                ),
              ),
            Center(
              child: TextField(
                
                ),
              ),
            Container( //vacio, espacio de separación:
              height: 50,
            ),
            Center(
               child: RaisedButton(
                 color: Colors.red,
                 padding: const EdgeInsets.fromLTRB( 50, 0, 50.0, 0),//Definir que tan grande es el boton
              onPressed: (){
                print(1);
              },
              child: Text(
                'Log in',
              ),

            ),
            )
            

            ],
          ),
        ),
    );

    
  }
}

