import 'dart:developer';

import 'package:api/api_client.dart';
import 'package:api/post.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:
            Container() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  getUsers() async {
    final response = await ApiClient.client.getUsers();

    response.forEach((element) {
      print(element.email);
    });
    final postRes = await ApiClient.client.postUsers(12);
    log(postRes.toString());

    PostRequest val =
        PostRequest(title: "asdf", body: "ssdfasdfasdfsadf", userId: 111);
    final postR = await ApiClient.client.postUers(val);
    log(postR.toString());
    // final delres = await ApiClient.client.deleteuser("10");
    // log(delres.toString());
  }
}
