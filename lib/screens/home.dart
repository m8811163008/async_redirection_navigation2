import 'package:async_redirection_navigation2/app.dart';
import 'package:async_redirection_navigation2/stream_auth.dart';
import 'package:async_redirection_navigation2/stream_auth_scope.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StreamAuth info = StreamAuthScope.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(App.title),
        actions: [
          IconButton(
            onPressed: () {
              info.signOut();
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Log out ${info.currentUser}',
          ),
        ],
      ),
      body: const Center(
        child: Text('Home screen'),
      ),
    );
  }
}
