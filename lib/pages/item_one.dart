import 'package:flutter/material.dart';

class ItemOne extends StatefulWidget {
  @override
  _ItemOneState createState() => _ItemOneState();
}

class _ItemOneState extends State<ItemOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item one')),
      body: Container(
        child: Center(child: Text('Item one')),
      ),
    );
  }
}
