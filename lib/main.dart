import 'package:flutter/material.dart';
import 'package:todo/presentation/router.dart';

void main() {
  runApp(Todo(
    router: AppRouter(),
  ));
}

class Todo extends StatelessWidget {
  final AppRouter router;

  const Todo({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.generateRoute);
  }
}
