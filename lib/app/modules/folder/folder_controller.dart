import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../models/folder.dart';
import '../../repositories/folders_repository.dart';
import '../../stores/auth_store.dart';

part 'folder_controller.g.dart';

class FolderController = _FolderControllerBase with _$FolderController;

abstract class _FolderControllerBase with Store {
  final AuthStore authStore = Modular.get();
  final FolderRepository folders = Modular.get();

  @observable
  String nome = "";

  @computed
  String get nomeError => nome.isEmpty ? "Informe o nome" : null;

  @observable
  String tipo = "";

  @computed
  String get tipoError => tipo.isEmpty ? "Informe o tipo" : null;

  @observable
  String cor = "";

  @observable
  String icon = "folder";

  @computed
  bool get canSave => nomeError == null && tipoError == null;

  @action
  void setNome(String value) {
    nome = value.trim();
  }

  @action
  void setTipo(String value) {
    tipo = value.trim();
  }

  @action
  void setCor(String value) {
    print(value);
    cor = value.trim();
  }

  @action
  void setIcon(String value) {
    icon = value;
  }

  @action
  Future<void> save() async {
    final folder = Folder(
        name: nome,
        color: cor,
        type: tipo,
        createdAt: DateTime.now(),
        icon: icon);
    try {
      await folders.addFolder(folder);
      Modular.to.pop();
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
