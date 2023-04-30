import 'package:async_redirection_navigation2/screens/home.dart';
import 'package:async_redirection_navigation2/screens/login.dart';
import 'package:async_redirection_navigation2/stream_auth_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  App({super.key});
  static String title = 'Async redirection with go router';

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _goRouter,
      title: App.title,
      debugShowCheckedModeBanner: false,
    );
  }

  late final _goRouter = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        name: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
    ],
    redirect: (context, state) async {
      final isLoggedIn = await StreamAuthScope.of(context).isSignIn();
      if (!isLoggedIn) {
        return '/login';
      }
      final isLogginIn = state.matchedLocation == '/login';
      if (isLogginIn) {
        return '/';
      }

      return null;
    },
  );
}
