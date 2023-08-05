import 'package:flutter/material.dart';
import 'package:flutter_auth_bootstrap/widgets/home_screen.dart';

class HomePage extends Page {
  final VoidCallback onLogout;

  const HomePage({
    required this.onLogout
  }) : super(key: const ValueKey('HomePage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return HomeScreen(onLogout: onLogout);
      }
    );
  }
}