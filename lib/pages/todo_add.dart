import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager/cubit/todo_cubit.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final todoTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Add Todo'),
            leading: IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  TextField(
                      controller: todoTitleController,
                      decoration: const InputDecoration(hintText: 'Title')),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<TodoCubit>(context)
                            .addTodo(todoTitleController.text.trim());
                        // context
                        //     .read<TodoCubit>()
                        //     .addTodo(todoTitleController.text.trim());
                        Navigator.of(context).pop();
                      },
                      child: const Text('Add'))
                ]))));
  }
}
