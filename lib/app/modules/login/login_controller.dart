import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'store/login_store.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginStore _store;
  _LoginControllerBase(this._store);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  String email;

  @action
  void setEmail(value) => email = value;

  @observable
  String password;

  @action
  void setPassword(value) => password = value;

  @action
  Future login() async {
    try {
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      print((await user.getIdToken()).token);
      _store.setToken((await user.getIdToken()).token);
    } catch (e) {
      Modular.to.showDialog(builder: (context) {
        return AlertDialog(
          content: Text("Alguma coisa esta errada."),
          title: Text("Ops..."),
        );
      });
    }
  }
}
