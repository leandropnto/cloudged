import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mime/mime.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart' as path_file;
import 'package:uuid/uuid.dart';

import '../../models/file_model.dart';
import '../../models/folder.dart';
import '../../repositories/folders_repository.dart';
import '../../stores/auth_store.dart';

part 'folder_detail_controller.g.dart';

class FolderDetailController = _FolderDetailControllerBase
    with _$FolderDetailController;

abstract class _FolderDetailControllerBase with Store {
  final AuthStore authStore = Modular.get();
  final FolderRepository folders = Modular.get();

  @observable
  Folder folder;

  @observable
  File file;

  @observable
  ObservableList files = ObservableList.of([]);

  @action
  Future<void> delete() async {
    try {
      await authStore.userReference
          .collection("folders")
          .document(folder.uid)
          .delete();
      Modular.to.pop();
    } on Exception catch (e) {
      Future.error(e);
    }
  }

  @action
  Future<void> load(Folder folder) async {
    authStore.userReference
        .collection("folders")
        .document(folder.uid)
        .collection("files")
        .snapshots()
        .listen((event) {
      files = ObservableList.of(event.documents
          .map<FileModel>((file) => FileModel.fromMap(file.data))
          .toList());
    });
  }

  @action
  Future<void> addFile(File file) async {
    final filenameStorage = "${Uuid().v4()}_${path_file.basename(file.path)}";
    final filename = path_file.basename(file.path);
    try {
      var storageTaskSnapshot = await FirebaseStorage.instance
          .ref()
          .child("documents/$filenameStorage")
          .putFile(file)
          .onComplete;

      final url = await storageTaskSnapshot.ref.getDownloadURL();
      final fileMode = FileModel(
        name: filename,
        createdAt: DateTime.now(),
        owner: folder.uid,
        user: authStore.userReference.documentID,
        urlDownload: url,
        size: storageTaskSnapshot.totalByteCount,
        contentType: lookupMimeType(file.path),
      );

      await folders.addFile(folder, fileMode);
    } on Exception catch (e) {
      Future.error(e);
    }
  }
}
