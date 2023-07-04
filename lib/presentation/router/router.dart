import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/fee_page.dart';
import '../pages/pafee_page.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final router = GoRouter(initialLocation: '/pafee', routes: [
    GoRoute(
      path: '/pafee',
      builder: (context, state) => const PafeePage(),
    ),
    GoRoute(
      path: '/fee',
      builder: (context, state) => FeePage(),
    )
  ]);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
