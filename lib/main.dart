import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plant_dec/home/HomePage.dart';
import 'package:plant_dec/home/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loading indicator while checking authentication state.
        } else {
          if (snapshot.hasData && snapshot.data != null) {
            // User is logged in, navigate to the home page or any other authenticated page.
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            );
          } else {
            // User is not logged in, show the login page.
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: LoginPage(),
            );
          }
        }
      },
    );
  }
}
