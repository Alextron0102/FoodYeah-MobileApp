import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
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
  HttpClient client = new HttpClient();
  HttpClientRequest request = await client.getUrl(Uri.parse(url));
  HttpClientResponse response = await request.close();
  return response.transform(Utf8Decoder()).transform(JsonDecoder()).toList();
}

class Album {
  final int id;
  final String title;

  Album({this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
  String toString() {
    return "id: ($id) \n title: ($title)";
  }
}

class RestTestPage extends StatefulWidget {
  static final name = "RestTestPage";
  @override
  _RestTestPageState createState() => _RestTestPageState();
}

class _RestTestPageState extends State<RestTestPage> {
  final TextEditingController _controller = TextEditingController();
  Future<Album> _futureAlbum;
  int tipo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        tipo = 1;
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('Get Data'),
                    onPressed: () {
                      setState(() {
                        _futureAlbum = getAlbum(_controller.text);
                        tipo = 1;
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('Get ALL Data'),
                    onPressed: () {
                      setState(() {
                        _futureAlbum = getAlbum("1");
                        tipo = 2;
                      });
                    },
                  ),
                ],
              )
            : (tipo == 2)
                ? FutureBuilder(
                    future: getList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List content = snapshot.data[0];
                        return new ListView.builder(
                            scrollDirection: Axis.vertical,
                            padding: new EdgeInsets.all(6.0),
                            itemCount: content.length,
                            itemBuilder: (BuildContext context, int index) {
                              return new GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RestTestPage()));
                                },
                                child: new Container(
                                  alignment: FractionalOffset.center,
                                  margin: new EdgeInsets.only(bottom: 6.0),
                                  padding: new EdgeInsets.all(6.0),
                                  color: Colors.blueGrey,
                                  child: new Text(
                                      '${content[index]['id']}: ${content[index]['title']}'),
                                ),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    },
                  )
                : FutureBuilder<Album>(
                    future: _futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          Text("id: ${snapshot.data.id},\ntitle: ${snapshot.data.title}"),
                          RaisedButton(
                            child: Text('Return'),
                            onPressed: () {
                              _futureAlbum =null;
                              setState(() {});
                            },
                          ),
                        ]);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    },
                  ),
      ),
    );
  }
}
