import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager/bloc/auth_bloc.dart';
import 'package:state_manager/bloc/counter_bloc.dart';
import 'package:state_manager/cubit/counter_cubit.dart';
import 'package:state_manager/cubit/todo_cubit.dart';
import 'package:state_manager/pages/login.dart';
import 'package:state_manager/pages/pallette.dart';
// import 'package:state_manager/pages/home.dart';
// import 'package:state_manager/pages/todo_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (_) => CounterCubit()),
        // BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => TodoCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: Pallete.backgroundColor),
        home: const LoginScreen(),
      ),
    );
  }
}
