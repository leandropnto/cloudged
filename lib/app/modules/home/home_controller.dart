import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../repositories/folders_repository.dart';
import '../../stores/auth_store.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final AuthStore authStore = Modular.get();
  final FolderRepository folderRepository = Modular.get();

  @action
  Future<void> load() async {
    //await authStore.logout();
    try {
      if ((await authStore.isLogged())) {
        Modular.to.pushReplacementNamed("/profile");
      }
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  @action
  Future<void> loginWithGoogle() async {
    print("Logando com o google");
    try {
      await authStore.loginWithGoogle();
      var logged = await authStore.isLogged();
      if (logged) {
        Modular.to.pushNamed("/profile");
      }
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}
