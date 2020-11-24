import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_module/app/modules/login/store/login_store.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final LoginStore _store;
  _RegisterControllerBase(this._store);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  String email;

  @action
  void setEmail(value) => email = value;

  @observable
  String password;

  @action
  void setPassword(value) => password = value;

  @observable
  String confirmPassword;

  @action
  void setConfirmPassword(value) => confirmPassword = value;

  @action
  Future login() async {
    if (password != null && password == confirmPassword) {
      try {
        final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
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
    } else {
      Modular.to.showDialog(builder: (context) {
        return AlertDialog(
          content: Text("Alguma coisa esta errada."),
          title: Text("Ops..."),
        );
      });
    }
  }
}
