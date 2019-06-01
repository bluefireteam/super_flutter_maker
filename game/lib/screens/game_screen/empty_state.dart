import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Choose a widget to start with...'));
  }
}