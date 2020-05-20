import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension StringExtension on String {
  String get firstLetterToUpperCase {
    if (this != null) {
      return "${this[0].toUpperCase()}${this.substring(1)}";
    } else {
      return null;
    }
  }
}
