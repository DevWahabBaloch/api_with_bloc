import 'dart:developer';

import 'package:api_with_bloc/config/routes/routes.gr.dart';
import 'package:api_with_bloc/core/constants/string_const.dart';
import 'package:api_with_bloc/core/mixin/validator.dart';
import 'package:api_with_bloc/features/auth/set_password/presentation/bloc/set_password_cubit.dart';
import 'package:api_with_bloc/features/auth/set_password/presentation/bloc/set_password_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SetPasswordPage extends StatefulWidget {
  const SetPasswordPage({super.key});

  @override
  State<SetPasswordPage> createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> with Validator {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Set Password',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child: Column(
          children: [
            BlocConsumer<SetPasswordCubit, SetPasswordState>(
              listener: (context, state) {
                if (state is LoadingState) {
                  const Center(child: CircularProgressIndicator());
                }
                if (state is LoadedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.responseMessage)));
                      log('Response message: ${state.responseMessage}');
                  Future.delayed(const Duration(milliseconds: 500), () {
                    context.pushRoute(const EmailVerifyRoute());
                  });
                }
                if (state is FailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Password',
                          hintStyle: const TextStyle(
                            color: Colors.white30,
                          ),
                        ),
                        validator: passwordValidator,
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        obscureText: true,
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Confirm Password',
                          hintStyle: const TextStyle(
                            color: Colors.white30,
                          ),
                        ),
                        validator: (value) {
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              return attemptToPassData();
                            }
                          },
                          child: const Text('Sign Up')),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void attemptToPassData() {
    Map<String, dynamic> bodyData = {
      StringConst.password: passwordController.text,
      StringConst.confirmPassword: confirmPasswordController.text,
    };
    context.read<SetPasswordCubit>().attemptToRegisterSetPassword(bodyData);
  }
}
