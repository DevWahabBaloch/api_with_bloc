import 'package:api_with_bloc/core/constants/string_const.dart';
import 'package:api_with_bloc/core/extensions/validator_ext.dart';
import 'package:api_with_bloc/core/mixin/validator.dart';
import 'package:api_with_bloc/features/splash_screen/presentation/auth/caregiver_signup/presentation/bloc/caregiver_cubit.dart';
import 'package:api_with_bloc/features/splash_screen/presentation/auth/caregiver_signup/presentation/bloc/caregiver_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CaregiverPage extends StatefulWidget {
  const CaregiverPage({super.key});

  @override
  State<CaregiverPage> createState() => _CaregiverPageState();
}

class _CaregiverPageState extends State<CaregiverPage> with Validator {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Caregiver',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
          child: BlocBuilder<CaregiverCubit, CaregiverState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is LoadedState) {
                return const Text('User registration successful',
                    style: TextStyle(fontSize: 22.0));
              }
              if (state is FailureState) {
                return Text(
                  state.message,
                  style: const TextStyle(fontSize: 22.0),
                );
              }
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'First Name',
                        hintStyle: const TextStyle(
                          color: Colors.white30,
                        ),
                      ),
                      validator: validateFirstName,
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Last Name',
                        hintStyle: const TextStyle(
                          color: Colors.white30,
                        ),
                      ),
                      validator: validateLastName,
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Email',
                        hintStyle: const TextStyle(
                          color: Colors.white30,
                        ),
                      ),
                      validator: (value) {
                        String? emailValidation = value?.emailValidation;
                        if (emailValidation != null) {
                          return emailValidation;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
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
          )),
    );
  }

  void attemptToPassData() {
    Map<String, dynamic> bodyData = {
      StringConst.firstName: firstNameController.text,
      StringConst.lastName: lastNameController.text,
      StringConst.email: emailController.text,
      StringConst.password: passwordController.text,
      StringConst.confirmPassword: confirmPasswordController.text,
      'role': 2
    };
    context.read<CaregiverCubit>().attemptToRegisterCaregiver(bodyData);
  }
}
