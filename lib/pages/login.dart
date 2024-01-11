import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager/bloc/auth_bloc.dart';
import 'package:state_manager/pages/todo_home.dart';
import 'package:state_manager/widgets/gradient_button.dart';
import 'package:state_manager/widgets/login_field.dart';
import 'package:state_manager/widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.error)));
      }
      if (state is AuthSuccess) {
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => const TodoHome()));
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const TodoHome()),
            (route) => false);
      }
    }, builder: (context, state) {
      if (state is AuthLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return SingleChildScrollView(
          child: Center(
              child: Column(children: [
        Image.asset('assets/images/signin_balls.png'),
        const Text('Sign In.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
        const SizedBox(height: 50),
        const SocialButton(
            iconPath: 'assets/svgs/g_logo.svg', label: 'Continue with Google'),
        const SizedBox(height: 20),
        const SocialButton(
          iconPath: 'assets/svgs/f_logo.svg',
          label: 'Continue with Facebook',
          horizontalPadding: 65,
        ),
        const SizedBox(height: 15),
        const Text('or', style: TextStyle(fontSize: 17)),
        const SizedBox(height: 15),
        LoginField(hintText: 'Email', controller: emailController),
        const SizedBox(height: 15),
        LoginField(hintText: 'Password', controller: passwordController),
        const SizedBox(height: 25),
        GradientButton(onPressed: () {
          BlocProvider.of<AuthBloc>(context).add(AuthLoginRequested(
              email: emailController.text.trim(),
              password: passwordController.text.trim()));
        })
      ])));
    }));
  }
}
