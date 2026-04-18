import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Login_cubit.dart';
import 'Login_state.dart';

class LoginFormPage extends StatelessWidget {
  const LoginFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Form Validation')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: 'Email@'),
                    onChanged: (value) =>
                        context.read<LoginCubit>().onEmailChanged(value),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                    onChanged: (value) =>
                        context.read<LoginCubit>().onPasswordChanged(value),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: state.isValid
                        ? () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Login Successful!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        : null,
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () =>
                        context.read<LoginCubit>().onClear(),
                    child: const Text('Clear'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}