# Boilerplate Firebase for Flutter

A boiler plate project created in Flutter using Bloc, Modular, and Firebase.

# Boilerplate Feature
* Splash
* Sign up
* Sign in
* Authenticate
* Modular (Routing)
* Bloc (State Management)

## Library & tools
* [Bloc](https://pub.dev/packages/bloc)
* [email validator](https://pub.dev/packages/email_validator)
* [Modular](https://pub.dev/packages/flutter_modular)
* [Firebase](https://firebase.google.com/docs/flutter/setup)

## Installation
**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/DollyFishR/boiler_plate_firebase.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

## Todo
 You need to add Firebase to your project before use authenticate function on this project.
 [Firebase Install](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwih5p-KiOSDAxVNTmwGHS-kBjUQFnoECBEQAQ&url=https%3A%2F%2Ffirebase.google.com%2Fdocs%2Fflutter%2Fsetup&usg=AOvVaw0MJ6O0eTldsl6nhsgJiBWF&opi=89978449)

 After that you need to uncomment code on "TODO" in main.dart, auth_repository.dart, sign_in_page.dart, sign_up_page.dart, dash_board.dart.
 
 * main.dart
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO uncomment the line below after adding firebase to your project
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}
```

 * auth_repository.dart
```dart
class AuthRepository {
  // TODO uncomment the line below after adding firebase to your project
  // final _firebaseAuth = FirebaseAuth.instance;
  // TODO comment the line below after adding firebase to your project
  final _firebaseAuth = null;

  ...
}
```

 * sign_in_page.dart
```dart
    ...
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                // TODO comment the line below after adding firebase to your project
                                Modular.to.navigate('/dashboard');
                                // TODO uncomment the line below after adding firebase to your project
                                // _authenticateWithOAuth(context, 'facebook');
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
                              // _authenticateWithOAuth(context, 'google');
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
                              // _authenticateWithOAuth(context, 'apple');
                            },
                            icon: Image.asset(
                              "assets/logo/apple.png",
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ],
                      ),
    ...
```

* sign_up_page.dart
```dart
    ...
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                // TODO comment the line below after adding firebase to your project
                                Modular.to.navigate('/dashboard');
                                // TODO uncomment the line below after adding firebase to your project
                                // _authenticateWithOAuth(context, 'facebook');
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
                              // _authenticateWithOAuth(context, 'google');
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
                              // _authenticateWithOAuth(context, 'apple');
                            },
                            icon: Image.asset(
                              "assets/logo/apple.png",
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ],
                      ),
    ...
```

 * dash_board.dart
```dart
    ...
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
    ...
```
 
## Folder Stucture
Here is the folder structure we have been using in this project

```
lib/
|- bloc/
|- constants/
|- models/
|- pages/
|- routes/
|- utils/
|- widgets/
|- main.dart
```

### Blocs

All the business logic of your application that using Bloc will go into this directory.

```
bloc/
|- auth_bloc/
    |- bloc/
        |- auth_bloc.dart
        |- auth_event.dart
        |- auth_state.dart
    |- repository/
        |- auth_repository.dart
```

### Constants

This directory contains all the application level constants.

```
constants/
|- color.dart
|- dimens.dart
```

### Models

This directory contains all the application models.

```
models/
|- example_model.dart
```

### Pages

This directory contains all the ui of your application. Each screen is located in a separate folder making it easy to combine group of files related to that particular screen.

```
pages/
|- dashboard/
    |- dashboard.dart
|- sign_in/
    |- sign_in_page.dart
|- sign_up/
    |- sign_up_page.dart
|- splash_screen/
    |- splash_screen.dart
```


### Routes

This directory contains all the route module of your application.

```
routes/
|- main_module.dart
```

### Utils

This directory contains the common file(s) and utilities used in a project.

```
utils/
|- box_styles.dart
|- sizes.dart
|-text_styles.dart
```

### Widgets

This directory contains widget template that use on your application.

```
widgets/
|- textfield_widget.dart
```

### Main

This is starting point of the application.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'routes/main_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO uncomment the line below after adding firebase to your project
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Boilerplate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
```
