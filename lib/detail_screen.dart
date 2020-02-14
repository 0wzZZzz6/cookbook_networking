import 'package:flutter/material.dart';
import './model/post.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final Post args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Center(
          child: ListTile(
        title: Text(args.title),
        subtitle: Text(args.body),
      )),
    );
  }
}
