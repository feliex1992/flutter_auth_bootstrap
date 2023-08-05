import 'package:flutter/material.dart';
import 'package:flutter_auth_bootstrap/models/auth_view_model.dart';
import 'package:flutter_auth_bootstrap/widgets/in_progress_message.dart';
import 'package:flutter_auth_bootstrap/widgets/logout_fab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onLogout;

  const HomeScreen({
    Key? key,
    required this.onLogout
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: _body(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: LogoutFab(onLogout: onLogout),
    );
  }

  Widget _body(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();
    bool inProgress;
    String? progressName;
    if (authViewModel.logingOut) {
      inProgress = true;
      progressName = "Logout";
    } else {
      inProgress = false;
      progressName = null;
    }
    return inProgress && progressName != null
        ? InProgressMessage(screenName: "HomeScreen", progressName: progressName)
        : const Center(
          child: Text('This is Home Page!!!'),
        );
  }
}