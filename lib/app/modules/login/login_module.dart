import 'package:login_module/app/modules/login/register/register_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_module/app/modules/login/store/login_store.dart';

import 'login_controller.dart';
import 'login_page.dart';
import 'register/register_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterController(i.get<LoginStore>())),
        Bind((i) => LoginController(i.get<LoginStore>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
        Router("/register",
            child: (_, args) => RegisterPage(),
            transition: TransitionType.downToUp),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
