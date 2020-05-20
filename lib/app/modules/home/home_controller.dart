import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../stores/auth_store.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final AuthStore authStore = Modular.get();
  @action
  Future<void> load() async {
    try {
      if ((await authStore.isLogged())) {
        Modular.to.pushReplacementNamed("/profile");
      }
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}
