import 'package:cookbook_networking/model/screen_arguments.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.body),
      ),
    );
  }
}
