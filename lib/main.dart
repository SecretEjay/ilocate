import 'package:flutter/material.dart';
import 'userLogin.dart'; // Import the new home screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Defines the root of the application.
    return MaterialApp(
      // The title of the app, which appears in the device's multitasking view.
      title: 'ILOCATE',
      // Removes the debug banner from the top-right corner of the screen.
      debugShowCheckedModeBanner: false,
      // Defines the theme for the entire app.
      theme: ThemeData(
        // The primary color for the app, used for app bars, buttons, etc.
        primarySwatch: Colors.red,
        // The font family for all text in the app.
        fontFamily: 'Roboto',
        // Sets a consistent visual density for widgets across platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Sets the initial screen of the app to UserLogin.
      home: const UserLogin(),
    );
  }
}
