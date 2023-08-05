import 'package:flutter/material.dart';
import 'package:flutter_auth_bootstrap/models/auth_view_model.dart';
import 'package:flutter_auth_bootstrap/widgets/in_progress_message.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback? onLogin;

  const LoginScreen({ Key? key, this.onLogin }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final authViewModel = context.watch<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Center(
        child: authViewModel.logingIn
            ? const InProgressMessage(screenName: "LoginScreen", progressName: "Login")
            : ElevatedButton(
                onPressed: () async {
                  final authViewModel = context.read<AuthViewModel>();
                  final result = await authViewModel.login();
                  if (result == true) {
                    onLogin!();
                  } else {
                    authViewModel.logingIn = false;
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Log in'),
                ),
              ),
      ),
    );
  }
}
