import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../blocs/auth_bloc/bloc/auth_bloc.dart';
import '../../utils/text_styles.dart';
import '../../widgets/textfield_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      // If email is valid adding new Event [SignInRequested].
      Modular.get<AuthBloc>().add(
        SignInRequested(_emailController.text, _passwordController.text),
      );
    }
  }

  void _authenticateWithGoogle(context) {
    Modular.get<AuthBloc>().add(
      GoogleSignInRequested(),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignIn"),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: Modular.get<AuthBloc>(),
        listener: (context, state) {
          if (state.status == AuthStatus.authenticated) {
            // Navigating to the dashboard screen if the user is authenticated
            Modular.to.navigate('/dashboard');
          }
          if (state.status == AuthStatus.error) {
            // Showing the error message if the user has entered invalid credentials
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error!)));
          }
        },
        builder: (context, state) {
          if (state.status == AuthStatus.loading) {
            // Showing the loading indicator while the user is signing in
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == AuthStatus.unauthenticated) {
            // Showing the sign in form if the user is not authenticated
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign In",
                        style: AppTextStyle.bold(Colors.black, 38),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Center(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFieldWidget(
                                controller: _emailController,
                                inputType: TextInputType.emailAddress,
                                hint: "Email",
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validate: (value) {
                                  return value != null &&
                                          !EmailValidator.validate(value)
                                      ? 'Enter a valid email'
                                      : null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFieldWidget(
                                controller: _passwordController,
                                hint: "Password",
                                isObscure: true,
                                inputType: TextInputType.text,
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validate: (value) {
                                  return value != null && value.length < 6
                                      ? "Enter min. 6 characters"
                                      : null;
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // TODO comment the line below after adding firebase to your project
                                    Modular.to.navigate('/dashboard');
                                    // TODO uncomment the line below after adding firebase to your project
                                    // _authenticateWithEmailAndPassword(context);
                                  },
                                  child: const Text('Sign In'),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // TODO comment the line below after adding firebase to your project
                          Modular.to.navigate('/dashboard');
                          // TODO uncomment the line below after adding firebase to your project
                          // _authenticateWithGoogle(context);
                        },
                        icon: Image.asset(
                          "assets/logo/google.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const Text("Don't have an account?"),
                      OutlinedButton(
                        onPressed: () {
                          Modular.to.navigate('/signUp');
                        },
                        child: const Text("Sign Up"),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
