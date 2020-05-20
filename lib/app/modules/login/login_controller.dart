import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../stores/auth_store.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthStore authStore = Modular.get();

  @observable
  FirebaseUser firebaseUser;

  @observable
  String email;

  @observable
  String password;

  @action
  void setEmail(String value) {
    email = value.trim();
  }

  @action
  void setPassword(String value) {
    password = value.trim();
  }

  @action
  Future login() async {
    try {
      // var authResult = await FirebaseAuth.instance
      //     .signInWithEmailAndPassword(email: email, password: password);

      // if (authResult.user != null) {
      //   firebaseUser = authResult.user;
      //   var documentSnapshot = await Firestore.instance
      //       .collection("users")
      //       .document(firebaseUser.uid)
      //       .get();

      await authStore.login(email, password);

      if (authStore.user != null) {
        Modular.to.pushReplacementNamed("/profile");
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
