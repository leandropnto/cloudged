import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../models/user.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final FirebaseAuth instance = FirebaseAuth.instance;
  DocumentReference userReference;

  @observable
  User user;

  @action
  Future<void> login([String email, String password]) async {
    try {
      var authResult = await instance.signInWithEmailAndPassword(
          email: email, password: password);
      if (authResult != null) {
        user = await _getUser();
      }
    } on Exception catch (e) {
      Future.error("Erro autenticando o usuário ${e.toString()}");
    }
  }

  Future<User> _getUser() async {
    var fireUser = await instance.currentUser();
    var snapshot = await Firestore.instance
        .collection('users')
        .document(fireUser.uid)
        .get();

    userReference = snapshot.reference;
    return User.fromMap(snapshot.data).copyWith(uid: fireUser.uid);
  }

  Future<bool> isLogged() async {
    if (user != null) return true;
    var fireUser = await instance.currentUser();
    if (fireUser != null){
      user = await  _getUser();
    }

    return user != null;
  }

  Future<void> logout() async {
    await instance.signOut();
    user = null;
    Modular.to.pushReplacementNamed("/");
  }
}
