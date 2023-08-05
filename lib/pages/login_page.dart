import 'package:flutter/material.dart';
import 'package:flutter_auth_bootstrap/widgets/login_screen.dart';

class LoginPage extends Page {
  final VoidCallback onLogin;

  const LoginPage({required this.onLogin}) : super(key: const ValueKey('LoginPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return LoginScreen(onLogin: onLogin);
      },
    );
  }
}
