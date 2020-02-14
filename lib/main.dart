import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './model/post.dart';
import './detail_screen.dart';

Future<List<Post>> fetchPost() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((post) => new Post.fromJson(post)).toList();
    // return Post.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load post');
  }
}

ListView _postsListView(data) {
  return ListView.builder(
    itemBuilder: (context, index) {
      if (index.isOdd) Divider();
      return _tile(data[index].title, data[index].body);
    },
    itemCount: data.length,
  );
}

ListTile _tile(String title, String body) {
  return ListTile(
    title: Text(title),
    subtitle: Text(body),
    trailing: IconButton(icon: Icon(Icons.arrow_right), onPressed: () {
      Navigator.pushNamed(context, routeName)
    }),
  );
}

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
                return _postsListView(data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
      routes: {DetailScreen.routeName: (context) => DetailScreen()},
    );
  }
}
