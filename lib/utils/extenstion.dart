import 'package:flutter/material.dart';

extension ok on BuildContext{
  Future navigate(BuildContext context, Widget widget) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => widget,));
}