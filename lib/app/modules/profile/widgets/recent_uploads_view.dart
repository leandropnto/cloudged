import 'package:flutter/material.dart';

import '../../../models/file_model.dart';
import 'file_list_tile.dart';

class RecentUploadsView extends StatelessWidget {
  final VoidCallback onOrderTap;
  final List<FileModel> files;

  const RecentUploadsView({
    Key key,
    this.onOrderTap,
    this.files,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SliverList(
      delegate: SliverChildListDelegate(
        files.map<Widget>((item) => FileListTile(file: item)).toList() ,
      ),
    );
  }
}
