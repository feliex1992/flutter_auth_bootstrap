import 'package:flutter/material.dart';
import 'package:flutter_auth_bootstrap/models/auth_view_model.dart';
import 'package:provider/provider.dart';

class LogoutFab extends StatelessWidget {
  final VoidCallback onLogout;

  const LogoutFab({
    Key? key,
    required this.onLogout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final authViewModel = context.watch<AuthViewModel>();
    return authViewModel.logingOut
        ? _inProgressFab()
        : _extendedFab(authViewModel);
  }

  FloatingActionButton _inProgressFab() {
    return const FloatingActionButton(
      onPressed: null,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
      ),
    );
  }

  FloatingActionButton _extendedFab(AuthViewModel authViewModel) {
    return FloatingActionButton.extended(
      icon: const Icon(Icons.exit_to_app),
      onPressed: () async {
        await authViewModel.logout();
        onLogout();
      },
      label: const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Logout'),
      ),
    );
  }
}