import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/constant/strings.dart';
import 'package:todo/cubit/add_todo_cubit.dart';
import 'package:todo/cubit/todos_cubit.dart';
import 'package:todo/data/network_service.dart';
import 'package:todo/data/repository.dart';
import 'package:todo/presentation/screens/add_todo_screen.dart';
import 'package:todo/presentation/screens/edit_todo_screen.dart';
import 'package:todo/presentation/screens/todos_screen.dart';

class AppRouter {
  Repository? repository;

  AppRouter() {
    repository = Repository(networkService: NetworkService());
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      TodosCubit(repository: repository),
                  child: TodosScreen(),
                ));
      case EDIT_TODO_ROUTE:
        return MaterialPageRoute(builder: (_) => EditTodoScreen());
      case ADD_TODO_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => AddTodoCubit(),
                  child: AddTodoScreen(),
                ));
      default:
        return null;
    }
  }
}
