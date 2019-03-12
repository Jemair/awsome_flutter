import 'package:flutter/material.dart';

class EditDemo extends StatefulWidget {
  @override
  _EditDemoState createState() => _EditDemoState();
}

class _EditDemoState extends State<EditDemo> {
  final TextEditingController _controller = TextEditingController();

  List<String> result = [];

  void _handleSubmit(String str) {
    _controller.clear();

    setState(() {
      result.add(str);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(hintText: 'Enter some text here...'),
          onSubmitted: _handleSubmit,
          controller: _controller,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          child: Column(
            children: _buildTextList(),
          ),
        )
      ],
    );
  }

  List<Widget> _buildTextList() {
    return result.map((String str) {
      return Text(
        str,
        style: TextStyle(color: Colors.black),
      );
    }).toList();
  }
}
