import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  String email;

  @observable
  String password;

  @action
  Future login() async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: 'bwolfnoob@gmail.com',
      password: '123456',
    ))
        .user;

    print((await user.getIdToken()).token);
  }
}
