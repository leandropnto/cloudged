import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/constants/text_styles.dart';
import '../../../common/widgets/icon_from_content_type.dart';
import '../../../models/file_model.dart';

class FileListTile extends StatelessWidget {
  final FileModel file;

  const FileListTile({Key key, this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconFromContentType(contentType: file.contentType),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  file.name ?? '_',
                  style: subLabelStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Text(
                    DateFormat('EEE, dd/MM/y', 'pt_BR').format(file.createdAt)),
              ],
            ),
          ),
          Text(file.fileSize),
        ],
      ),
    );
  }
}
