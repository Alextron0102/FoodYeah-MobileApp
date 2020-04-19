import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

String url = 'https://jsonplaceholder.typicode.com/albums';

Future<Album> createAlbum(String title) async {
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

Future<Album> getAlbum(String id) async {
  final http.Response response = await http.get(('$url/$id'));
  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to get album.');
  }
}

Future<List> getList() async {
  HttpClient client1 = new HttpClient();
  HttpClientRequest request = await client1.getUrl(Uri.parse(url));
  HttpClientResponse response1 = await request.close();
  return response1.transform(Utf8Decoder()).transform(JsonDecoder()).toList();
}

Future<String> getAll() async {
  //La funcion de arriba no sirve, esta tampoco
  final http.Response response = await http.get(('$url'));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to get album.');
  }
}

class Album {
  final int id;
  final String title;
  final int userid;
  Album({this.id, this.title, this.userid});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
      userid: json['userid'],
    );
  }
}

class HomePage extends StatefulWidget {
  static final name = "/HomePage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  Future<Album> _futureAlbum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          titleSpacing: 0,
          title: Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Text(
                    "FoodYeah!",
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Icon(
                    Icons.home,
                  ),
                ),
              ],
            ),
          )),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: (_futureAlbum == null)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Enter Title/Id'),
                  ),
                  RaisedButton(
                    child: Text('Create Data'),
                    onPressed: () {
                      setState(() {
                        _futureAlbum = createAlbum(_controller.text);
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('Get Data'),
                    onPressed: () {
                      setState(() {
                        _futureAlbum = getAlbum(_controller.text);
                      });
                    },
                  ),
                ],
              )
            : FutureBuilder<Album>(
                future: _futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              "userid: ${snapshot.data.userid},\ntitle: ${snapshot.data.title}"),
                          RaisedButton(
                            child: Text('Return'),
                            onPressed: () {
                              _futureAlbum = null;
                              setState(() {});
                            },
                          ),
                        ]);
                  } else if (snapshot.hasError) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("${snapshot.error}"),
                          RaisedButton(
                            child: Text('Return'),
                            onPressed: () {
                              _futureAlbum = null;
                              setState(() {});
                            },
                          ),
                        ]);
                  }
                  return CircularProgressIndicator();
                },
              ),
      ),
    );
  }
}
