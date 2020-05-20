import 'package:flutter/material.dart';

import '../../../models/folder.dart';
import 'folder_widget.dart';

class FoldersView extends StatelessWidget {
  final List<Folder> folders;

  const FoldersView({Key key, this.folders}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: folders
          .map<Widget>(
            (folder) => FolderWidget(
              folder: folder,
            ),
          )
          .toList(),
    );
  }
}
