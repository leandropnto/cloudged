import 'package:flutter/material.dart';

import '../../../common/constants/text_styles.dart';
import '../../../common/extensions/context_extensions.dart';
import '../../../common/extensions/string_extensions.dart';
import '../../../models/folder.dart';
import '../../../models/item_icon.dart';

class FolderHeaderView extends StatelessWidget {
  final Folder folder;

  const FolderHeaderView({Key key, this.folder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(16),
        height: 200,
        padding: const EdgeInsets.all(16),
        width: context.width * 8,
        decoration: BoxDecoration(
          color: folder.color.hexToColor ?? Colors.red,
          image: DecorationImage(
              image: AssetImage("assets/images/folder2.png"),
              fit: BoxFit.fitWidth),
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
                  color: Colors.red,
                ),
                Icon(
                  Icons.more_vert,
                  size: 30,
                  color: Colors.red,
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        folder.name ?? "",
                        style: folderLabelStyle.copyWith(
                            color: Colors.white, fontSize: 30),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        folder.createdAtFormated,
                        style:
                            folderSubLabelStyle.copyWith(color: Colors.white),
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
                // Container(
                //   width: 80,
                //   height: 80,
                //   child: CircleAvatar(
                //     backgroundImage: AssetImage(
                //       "assets/images/folders1.png",
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
