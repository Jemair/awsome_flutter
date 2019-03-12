import 'package:flutter/material.dart';
import 'package:input_demo/edit_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Edit Demo'),
        ),
        body: EditDemo(),
      ),
    );
  }
}
