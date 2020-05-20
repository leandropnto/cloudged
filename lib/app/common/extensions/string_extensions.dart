import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

extension StringExtensions on String {
  Color get hexToColor => Color(int.parse(this));

  IconData get toIcon {
    if (this == "trash") {
      return FontAwesomeIcons.trash;
    } else if (this == "video") {
      return FontAwesomeIcons.video;
    } else {
      return FontAwesomeIcons.folder;
    }
  }
}
