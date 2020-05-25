import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String token;

  @action
  setToken(value) => token = value;

  @computed
  bool get isLogged => token != null && token != "";
}
