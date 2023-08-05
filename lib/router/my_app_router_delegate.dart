import 'package:flutter/material.dart';
import 'package:flutter_auth_bootstrap/data/auth_repository.dart';
import 'package:flutter_auth_bootstrap/pages/home_page.dart';
import 'package:flutter_auth_bootstrap/pages/login_page.dart';
import 'package:flutter_auth_bootstrap/pages/splash_page.dart';

class MyAppRouterDelegate extends RouterDelegate with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final AuthRepository authRepository;

  bool? _loggedIn;
  bool? get loggedIn => _loggedIn;
  set loggedIn(value) {
    _loggedIn = value;
    notifyListeners();
  }

  MyAppRouterDelegate(this.authRepository) {
    _init();
  }

  _init() async {
    loggedIn = await authRepository.isUserLoggedIn();
    if (loggedIn == true) {}
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) {
    List<Page> stack;
    final loggedIn = this.loggedIn;
    if (loggedIn == null) {
      stack = _splashStack;
    } else if (loggedIn == true) {
      stack = _loggedInStack();
    } else {
      stack = _loggedOutStack;
    }
    return Navigator(
      key: navigatorKey,
      pages: stack,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  List<Page> get _splashStack {
    String? process;
    if (loggedIn == null) {
      process = 'Checking login state...';
    } else {
      process = "Unidentified process";
    }
    return [
      SplashPage(process: process),
    ];
  }

  List<Page> get _loggedOutStack => [
        LoginPage(onLogin: () async {
          loggedIn = true;
        })
      ];

  List<Page> _loggedInStack() {
    onLogout() async {
      loggedIn = false;
    }

    return [
      HomePage(onLogout: onLogout),
    ];
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}

}