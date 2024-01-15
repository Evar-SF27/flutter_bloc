import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager/cubit/todo_cubit.dart';
import 'package:state_manager/models/todo_model.dart';
import 'package:state_manager/pages/todo_add.dart';
import 'package:state_manager/pages/weather.dart';

class TodoHome extends StatelessWidget {
  const TodoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Todo List'), actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const WeatherScreen())));
              },
              icon: const Icon(Icons.light_mode))
        ]),
        body: BlocBuilder<TodoCubit, List<Todo>>(builder: (context, todos) {
          return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];

                return ListTile(title: Text(todo.name));
              });
        }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddTodo()));
            },
            tooltip: 'Add Todo',
            child: const Icon(Icons.add)));
  }
}
