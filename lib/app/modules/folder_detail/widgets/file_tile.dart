import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/extensions/context_extensions.dart';
import '../../../models/file_model.dart';

class FileTile extends StatelessWidget {
  final FileModel file;

  const FileTile({Key key, this.file}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
     margin: const EdgeInsets.all(16),
     padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("${file.name} - 1MB", style: context.textTheme.subtitle2,),
          Text(DateFormat("dd/MM/y").format(file.createdAt)),
        ],
      ),
    );
  }
}
