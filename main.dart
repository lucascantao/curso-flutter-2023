import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(initialLocation: '/', routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(child: TelaHome()),
      ),
      GoRoute(
        path: '/telaA',
        pageBuilder: (context, state) => const MaterialPage(child: TelaA()),
      ),
      GoRoute(
        path: '/telaA/telaB',
        pageBuilder: (context, state) => const MaterialPage(child: TelaB()),
      ),
    ]);

    return MaterialApp.router(
      theme: ThemeData.dark(),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => GoRouter.of(context).go('/telaA'),
          child: const Text("Go Tela A"),
        ),
      ),
    );
  }
}

class TelaA extends StatelessWidget {
  const TelaA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela A"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => GoRouter.of(context).go('/telaA/telaB'),
          child: const Text("Go Tela B"),
        ),
      ),
    );
  }
}

class TelaB extends StatelessWidget {
  const TelaB({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela B"),
      ),
      body: Center(
        child: TextButton(
            onPressed: () => GoRouter.of(context).,
            child: const Text("Go to Tela A")),
      ),
    );
  }
}
