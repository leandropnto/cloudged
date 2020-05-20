
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/constants/text_styles.dart';
import '../../models/folder.dart';
import '../profile/widgets/file_list_tile.dart';
import 'folder_detail_controller.dart';
import 'widgets/folder_header_view.dart';

class FolderDetailPage extends StatefulWidget {
  final Folder folder;
  const FolderDetailPage({Key key, this.folder}) : super(key: key);

  @override
  _FolderDetailPageState createState() => _FolderDetailPageState();
}

class _FolderDetailPageState
    extends ModularState<FolderDetailPage, FolderDetailController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    controller.load(widget.folder);
  }

  @override
  Widget build(BuildContext context) {
    controller.folder = widget.folder;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.folder.name,
          overflow: TextOverflow.ellipsis,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                FontAwesomeIcons.plus,
                color: Colors.white,
              ),
              onPressed: () async {
                final file = await FilePicker.getFile();
                if (file != null) {
                  controller.addFile(file);
                }
              }),
          IconButton(
              icon: Icon(
                FontAwesomeIcons.trash,
                color: Colors.white,
              ),
              onPressed: controller.delete),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FolderHeaderView(
              folder: widget.folder,
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(width: 1, color: Colors.grey[400]),
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    'Arquivos',
                    style: subLabelStyle,
                  ),
                  Spacer(),
                  IconButton(
                      icon: Icon(Icons.list, color: Colors.red),
                      onPressed: () {}),
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.grid_on,
                      ),
                      onPressed: () {}),
                ],
              ),
            ),
            Observer(
              builder: (_) => Column(
                children: controller.files
                    .map<Widget>((file) => FileListTile(file: file))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
