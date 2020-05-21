import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../models/file_model.dart';
import '../models/folder.dart';
import '../models/user.dart';
import '../stores/auth_store.dart';

class FolderRepository {
  final AuthStore authStore = Modular.get();

  Future<void> addFolder(Folder folder) async {
    final userUid = authStore.user.uid;

    try {
      var documentReference = await Firestore.instance
          .collection("users")
          .document(userUid)
          .collection("folders")
          .add(folder.toMap());

      await documentReference.updateData({'uid': documentReference.documentID});
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> addFile([Folder folder, FileModel fileModel]) async {
    final userUid = authStore.user.uid;
    try {
      var documentReference = await Firestore.instance
          .collection("users")
          .document(userUid)
          .collection("folders")
          .document(folder.uid)
          .collection("files")
          .add(fileModel.toMap());

      final fileUid = documentReference.documentID;
      await documentReference.updateData({'uid': fileUid});

      await authStore.userReference
          .collection("lastFiles")
          .add(fileModel.copyWith(uid: fileUid).toMap());
    } on Exception catch (e) {
      Future.error(e);
    }
  }

  Future<DocumentReference> createUser(User user) async {
    return await Firestore.instance.collection("users").add(user.toMap());
  }
}
