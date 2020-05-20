import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../models/file_model.dart';
import '../../models/folder.dart';
import '../../models/user.dart';
import '../../stores/auth_store.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final AuthStore authStore = Modular.get<AuthStore>();

  @observable
  User user = User();

  @observable
  ObservableList<Folder> folders = ObservableList.of([]);

  @observable
  ObservableList<FileModel> files = ObservableList.of([]);

  @action
  Future<void> load() async {
    try {
      user = authStore.user;

      Firestore.instance
          .collection("users")
          .document(authStore.user.uid)
          .snapshots()
          .listen((event) {
        user = User.fromMap(event.data);
      });

      Firestore.instance
          .collection("users")
          .document(user.uid)
          .collection("folders")
          .snapshots()
          .listen((event) {
        folders = ObservableList.of(event.documents
            .map<Folder>((item) =>
                Folder.fromMap(item.data).copyWith(uid: item.documentID))
            .toList());
      });

      authStore.userReference
          .collection("lastFiles")
          .snapshots()
          .listen((event) {
        files = ObservableList.of(event.documents
            .map<FileModel>((item) => FileModel.fromMap(item.data))
            .toList());
      });
    } on Exception catch (e) {
      return Future.error("Erro carregando a lista de pastas ${e.toString()}");
    }
  }
}
