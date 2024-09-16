import 'package:avancor/ui/screens/login_screen.dart';
import 'package:avancor/ui/screens/login_view_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Avancor());
}

class Avancor extends StatelessWidget {
  const Avancor({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: LoginScreen(LoginViewModel()),
    );
  }
}
