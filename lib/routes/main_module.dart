import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../blocs/auth_bloc/bloc/auth_bloc.dart';
import '../blocs/auth_bloc/repository/auth_repository.dart';
import '../pages/auth_page/sign_in_page.dart';
import '../pages/auth_page/sign_up_page.dart';
import '../pages/dashboard/dashboard.dart';
import '../pages/splash_screen/splash_screen.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addInstance(AuthRepository());
    i.addLazySingleton<AuthBloc>(AuthBloc.new, config: blocConfig());
  }

  BindConfig<T> blocConfig<T extends Bloc>() {
    return BindConfig(
      notifier: (T bloc) => bloc.stream,
      onDispose: (T bloc) => bloc.close(),
    );
  }

  @override
  void routes(r) {
    r.child('/', child: (BuildContext context) => const SplashScreen());
    r.child('/signIn', child: (BuildContext context) => const SignIn());
    r.child('/signUp', child: (BuildContext context) => const SignUp());
    r.child('/dashboard', child: (BuildContext context) => const Dashboard());
  }
}
