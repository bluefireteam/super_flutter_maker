import 'package:flutter/material.dart';

Widget pad(Widget w, { double p = 16.0 }) {
  return Container(child: w, padding: EdgeInsets.all(p));
}