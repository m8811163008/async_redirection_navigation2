import 'package:async_redirection_navigation2/stream_auth_scope.dart';
import 'package:flutter/material.dart';


import '../app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isLogginIn = false;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..addListener(() {
            setState(() {});
          });
    _controller.repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(App.title),
      ),
      body: Center(
        child: Column(
          children: [
            if (_isLogginIn)
              CircularProgressIndicator(
                value: _controller.value,
              ),
            if (!_isLogginIn)
              ElevatedButton(
                onPressed: () {
                  StreamAuthScope.of(context).signIn('test_user');
                  setState(() {
                    _isLogginIn = true;
                  });
                },
                child: const Text('Login'),
              )
          ],
        ),
      ),
    );
  }
}
