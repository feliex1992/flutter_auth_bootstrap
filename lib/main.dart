import 'package:flutter/material.dart';
import 'package:flutter_auth_bootstrap/data/auth_repository.dart';
import 'package:flutter_auth_bootstrap/data/cache/preference.dart';
import 'package:flutter_auth_bootstrap/models/auth_view_model.dart';
import 'package:flutter_auth_bootstrap/router/my_app_router_delegate.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MyAppRouterDelegate delegate;
  late AuthRepository authRepository;

  @override
  void initState() {
    super.initState();
    authRepository = AuthRepository(Preference());
    delegate = MyAppRouterDelegate(authRepository);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(
          create: (_) => AuthViewModel(authRepository),
        ),
      ],
      child: MaterialApp(
        home: Router(
          routerDelegate: delegate,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}