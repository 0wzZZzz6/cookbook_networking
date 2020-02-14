import 'package:flutter/material.dart';
import '../model/post.dart';
import '../pages/detail_screen.dart';
import '../model/screen_arguments.dart';

ListTile tile(BuildContext context, List<Post> data, int index) {
  print(data[index].id);
  return ListTile(
    title: Text(data[index].title),
    trailing: IconButton(
        icon: Icon(Icons.arrow_right),
        onPressed: () {
          Navigator.pushNamed(context, DetailScreen.routeName,
              arguments: ScreenArguments(data[index].title, data[index].body));
        }),
  );
}
