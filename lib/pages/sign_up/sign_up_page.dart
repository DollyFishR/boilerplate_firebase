import 'package:boiler_plate_firebase/bloc/auth_bloc/auth_bloc.dart';
import 'package:boiler_plate_firebase/core/widgets/textfield_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      Modular.get<AuthBloc>().add(
        SignUpRequested(_emailController.text, _passwordController.text),
      );
    }
  }

//
  void _authenticateWithGoogle(context) {
    Modular.get<AuthBloc>().add(
      GoogleSignInRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: Modular.get<AuthBloc>(),
        listener: (context, state) {
          if (state.status == AuthStatus.authenticated) {
            // Navigating to the dashboard screen if the user is authenticated
            Modular.to.navigate('/dashboard');
          }
          if (state.status == AuthStatus.error) {
            // Displaying the error message if the user is not authenticated
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error!)));
          }
        },
        builder: (context, state) {
          if (state.status == AuthStatus.loading) {
            // Displaying the loading indicator while the user is signing up
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == AuthStatus.unauthenticated) {
            // Displaying the sign up form if the user is not authenticated
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
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
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                                isObscure: true,
                                inputType: TextInputType.text,
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
                                  child: const Text('Sign Up'),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Text("Already have an account?"),
                      OutlinedButton(
                        onPressed: () {
                          Modular.to.navigate('/signIn');
                        },
                        child: const Text("Sign In"),
                      ),
                      const Text("Or"),
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
