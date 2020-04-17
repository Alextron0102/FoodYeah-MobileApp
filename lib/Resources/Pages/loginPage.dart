import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static final name = "LoginPage";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
            'assets/images/background/uni.jpg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image(
                    image: AssetImage('assets/images/logo/logotransparent.png'),
                  ),
                ),
                Center(
                  child: TextField(
                    //FocusScope.of(context).requestFocus(new FocusNode()),
                    style: TextStyle(
                      fontFamily: 'Solano',
                      color: Colors.white,
                      fontSize: 30.0,
                      ),
                    cursorColor: Colors.white,
                    autocorrect: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                            ),
                        contentPadding:
                            EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0),
                        hintText: 'USUARIO',
                        hintStyle: TextStyle(
                          fontFamily: 'Solano',
                          color: Colors.white
                          ),
                        ),
                  ),
                ),
                Container(
                  height: 40,
                ),
                Center(
                  child: TextField(
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Solano',
                      color: Colors.white
                      ),
                    cursorColor: Colors.white,
                    autocorrect: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        contentPadding:
                            EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0),
                        hintText: 'CONTRASEÑA',
                        hintStyle: TextStyle(
                          fontFamily: 'Solano',
                          color: Colors.white
                          ),
                        ),
                  ),
                ),
                Container(
                  //vacio, espacio de separación:
                  height: 60,
                ),
                Center(
                  child: FlatButton(
                    onPressed: () {
                      print(1);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      side: BorderSide(color: Colors.white),
                    ),
                    textColor: Colors.white,
                    splashColor: Colors.grey,
                    color: Colors.red,
                    padding: const EdgeInsets.fromLTRB(50, 10, 50.0, 5), //Definir que tan grande es el boton
                    child: Text(
                      'INGRESAR',                      
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Solano',
                        fontSize: 25,
                        ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
