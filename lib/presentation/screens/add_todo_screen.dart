import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/add_todo_cubit.dart';

class AddTodoScreen extends StatelessWidget {
  final _controller = TextEditingController();

  AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add Todo")),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: _body(context),
        ));
  }

  Widget _body(context) {
    return Column(
      children: [
        TextField(
          autofocus: true,
          controller: _controller,
          decoration: InputDecoration(hintText: "Enter todo message..."),
        ),
        SizedBox(height: 10.0),
        InkWell(
            onTap: () {
              final message = _controller.text;
              BlocProvider.of<AddTodoCubit>(context).addTodo(message);
            },
            child: _addBtn(context))
      ],
    );
  }

  Widget _addBtn(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
      child: Center(
          child: Text("Add Todo", style: TextStyle(color: Colors.white))),
    );
  }
}
