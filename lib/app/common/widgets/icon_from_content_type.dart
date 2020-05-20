import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconFromContentType extends StatelessWidget {
  final String contentType;
  final double size;

  const IconFromContentType({
    Key key,
    this.contentType,
    this.size = 30,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    switch (contentType) {
      case "application/pdf":
        return Icon(
          FontAwesomeIcons.filePdf,
          size: size,
        );
      case "image/jpg":
        return Icon(
          FontAwesomeIcons.image,
          size: size,
        );
      case "application/msword":
        return Icon(
          FontAwesomeIcons.fileWord,
          size: size,
        );
      case "application/vnd.openxmlformats-officedocument.wordprocessingml.document":
        return Icon(
          FontAwesomeIcons.fileWord,
          size: size,
        );
      default:
        return Icon(
          FontAwesomeIcons.file,
          size: size,
        );
    }
  }
}
