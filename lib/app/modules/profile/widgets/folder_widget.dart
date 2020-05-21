import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../common/constants/text_styles.dart';
import '../../../common/extensions/context_extensions.dart';
import '../../../common/extensions/string_extensions.dart';
import '../../../models/folder.dart';
import '../../../models/item_icon.dart';

class FolderWidget extends StatelessWidget {

  final Folder folder;

  const FolderWidget({
    Key key,
    this.folder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed("/folderdetail", arguments: folder);
      },
      child: Container(
        margin: const EdgeInsets.all(16),
        height: 80,
        padding: const EdgeInsets.all(16),
        width: context.width * .35,
        decoration: BoxDecoration(
          color: folder.color.hexToColor ?? Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  ItemIcon.from(folder.icon),
                  size: 48,
                  color: Colors.white,
                ),
                Icon(
                  Icons.more_vert,
                  size: 30,
                  color: Colors.white,
                ),
              ],
            ),
            Spacer(),
            Text(
              folder.name ?? "",
              style: folderLabelStyle.copyWith(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              folder.createdAtFormated,
              style: folderSubLabelStyle.copyWith(color: Colors.white),
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }
}
