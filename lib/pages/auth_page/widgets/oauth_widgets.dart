import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Widget oauthGroup() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
          onPressed: () {
            // TODO comment the line below after adding firebase to your project
            Modular.to.navigate('/dashboard');
            // TODO uncomment the line below after adding firebase to your project
            // authenticateWithOAuth(context, 'facebook');
          },
          icon: const Icon(
            Icons.facebook,
            color: Colors.blueAccent,
            size: 30,
          )),
      IconButton(
        onPressed: () {
          // TODO comment the line below after adding firebase to your project
          Modular.to.navigate('/dashboard');
          // TODO uncomment the line below after adding firebase to your project
          // authenticateWithOAuth(context, 'google');
        },
        icon: Image.asset(
          "assets/logo/google.png",
          height: 30,
          width: 30,
        ),
      ),
      IconButton(
        onPressed: () {
          // TODO comment the line below after adding firebase to your project
          Modular.to.navigate('/dashboard');
          // TODO uncomment the line below after adding firebase to your project
          // authenticateWithOAuth(context, 'apple');
        },
        icon: Image.asset(
          "assets/logo/apple.png",
          height: 30,
          width: 30,
        ),
      ),
    ],
  );
}
