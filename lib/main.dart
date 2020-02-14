import 'dart:async';

import 'package:cookbook_networking/helpers/custom_drawer.dart';
import 'package:flutter/material.dart';

import './model/post.dart';
import './pages/detail_screen.dart';
import './web/fetch_post.dart';
import './helpers/posts_listView.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Post> post;

  // @override
  // void initState() {
  //   super.initState();
  //   post = fetchPost();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Fetch Data Example'),
          ),
          body: Center(
            child: FutureBuilder<List<Post>>(
              future: fetchPost(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Post> data = snapshot.data;
                  return postsListView(data);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          ),
          drawer: CustomDrawer()),
      routes: {DetailScreen.routeName: (context) => DetailScreen()},
    );
  }
}
