import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../blocs/auth_bloc/bloc/auth_bloc.dart';

void authenticateWithEmailAndPassword(context, GlobalKey<FormState> formKey) {
  if (formKey.currentState!.validate()) {
    // TODO comment the line below after adding firebase to your project
    Modular.to.navigate('/dashboard');
    // TODO uncomment the line below after adding firebase to your project
    // Modular.get<AuthBloc>().add(
    //   SignInRequested(_emailController.text, _passwordController.text),
    // );
  }
}

void authenticateWithOAuth(context, String provider) {
  AuthEvent event;
  switch (provider) {
    case 'google':
      event = GoogleSignInRequested();
      break;
    case 'facebook':
      event = FacebookSignInRequested();
      break;
    case 'apple':
      event = AppleSignInRequested();
      break;
    default:
      return;
  }
  Modular.get<AuthBloc>().add(event);
}
