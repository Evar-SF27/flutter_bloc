import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager/bloc/auth_bloc.dart';
import 'package:state_manager/bloc/weather_bloc.dart';
import 'package:state_manager/cubit/todo_cubit.dart';
import 'package:state_manager/data/provider/weather_data_provider.dart';
import 'package:state_manager/data/repository/weather_repository.dart';
import 'package:state_manager/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => WeatherRepository(WeatherDataProvider()),
        child: MultiBlocProvider(
            providers: [
              // BlocProvider(create: (_) => CounterCubit()),
              // BlocProvider(create: (_) => CounterBloc()),
              BlocProvider(create: (_) => AuthBloc()),
              BlocProvider(create: (_) => TodoCubit()),
              BlocProvider(
                  create: (context) =>
                      WeatherBloc(context.read<WeatherRepository>())),
            ],
            child: MaterialApp(
              title: 'State Manager',
              theme: ThemeData.dark(useMaterial3: true),
              home: const LoginScreen(),
            )));
  }
}
