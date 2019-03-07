import 'package:flutter/material.dart';

class NoKeepAlive extends StatelessWidget {
  NoKeepAlive({
    Key key,
    @required this.children,
    @required this.currentIndex,
  }) : super(key: key);

  final children;
  final currentIndex;

  @override
  Widget build(BuildContext context) {
    if (this.currentIndex != 0) return Container();
    return this.children;
  }
}
