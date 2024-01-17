# Boilerplate Firebase for Flutter

A boiler plate project created in Flutter using Bloc, Modular, and Firebase.

# Boilerplate Feature
* Splash
* Login
* Signin
* Modular (Routing)
* Bloc (State Management)

## Library & tools
* Bloc
* email validator
* Modular
* Firebase

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

```
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
