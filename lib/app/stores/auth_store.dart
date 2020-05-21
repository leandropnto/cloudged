import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudged/app/models/folder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  @action
  Future<void> loginWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn();
      final googleSignInAccount = await googleSignIn.signIn();
      final googleSignInAuthentication =
          await googleSignInAccount.authentication;

      if (googleSignInAuthentication.accessToken != null) {
        final credential = GoogleAuthProvider.getCredential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        var firebaseUser =
            (await instance.signInWithCredential(credential)).user;
        print("${firebaseUser?.displayName} - ${firebaseUser.email}");
        user = await _getUser();
      }
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<User> _getUser() async {
    var fireUser = await instance.currentUser();
    var snapshot = await Firestore.instance
        .collection('users')
        .document(fireUser.uid)
        .get();

    final data = snapshot.data ?? await _createUserData();
    userReference = snapshot.reference;
    return User.fromMap(data).copyWith(uid: fireUser.uid);
  }

  Future<bool> isLogged() async {
    if (user != null) return true;
    var fireUser = await instance.currentUser();
    if (fireUser != null) {
      user = await _getUser();
    }

    return user != null;
  }

  Future<void> logout() async {
    await instance.signOut();
    user = null;
    Modular.to.pushReplacementNamed("/");
  }

  Future<Map<String, dynamic>> _createUserData() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await Firestore.instance
        .collection("users")
        .document(firebaseUser.uid)
        .setData(User(
                name: firebaseUser.displayName,
                email: firebaseUser.email,
                uid: firebaseUser.uid,
                alias: "Seu apelido",
                description: "Suas informações")
            .toMap());

    await Firestore.instance
        .collection("users")
        .document(firebaseUser.uid)
        .collection("folders")
        .add(Folder.startFolder().toMap());

    await Firestore.instance
        .collection("users")
        .document(firebaseUser.uid)
        .collection("lastFiles");

    return (await Firestore.instance
            .collection("users")
            .document(firebaseUser.uid)
            .get())
        .data;
  }
}
