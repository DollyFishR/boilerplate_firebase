import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../blocs/auth_bloc/bloc/auth_bloc.dart';
import '../../utils/text_styles.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Getting the user from the FirebaseAuth Instance
    // final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        bloc: Modular.get<AuthBloc>(),
        listener: (context, state) {
          if (state.status == AuthStatus.unauthenticated) {
            // Navigate to the sign in screen when the user Signs Out
            // pop modular to remove all routes and push to sign in
            Modular.to.navigate('/signIn');
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello',
                style: AppTextStyle.regular(Colors.black, 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text('Sign Out'),
                onPressed: () {
                  // Signing out the user
                  // TODO comment the line below after adding firebase to your project
                  Modular.to.navigate('/signIn');
                  // TODO uncomment the line below after adding firebase to your project
                  // Modular.get<AuthBloc>().add(SignOutRequested());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
