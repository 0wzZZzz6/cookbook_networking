import 'package:flutter/material.dart';
import './posts_listTile.dart';

ListView postsListView(data) {
  return ListView.builder(
    itemBuilder: (context, index) {
      return tile(context, data, index);
    },
    itemCount: data.length,
  );
}
