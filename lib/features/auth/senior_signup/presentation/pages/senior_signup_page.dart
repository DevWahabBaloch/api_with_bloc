import 'package:api_with_bloc/config/routes/routes.gr.dart';
import 'package:api_with_bloc/core/constants/string_const.dart';
import 'package:api_with_bloc/core/extensions/validator_ext.dart';
import 'package:api_with_bloc/core/mixin/validator.dart';
import 'package:api_with_bloc/features/auth/senior_signup/presentation/bloc/senior_cubit.dart';
import 'package:api_with_bloc/features/auth/senior_signup/presentation/bloc/senior_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SeniorPage extends StatefulWidget {
  const SeniorPage({super.key});

  @override
  State<SeniorPage> createState() => _SeniorPageState();
}

class _SeniorPageState extends State<SeniorPage> with Validator {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Senior',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
          child: BlocConsumer<SeniorCubit, SeniorState>(
            listener: (context, state) {
              if (state is LoadingState) {
                const Center(child: CircularProgressIndicator());
              }
              if (state is LoadedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.responseMessage)));
                Future.delayed(const Duration(microseconds: 100), () {
                  context.pushRoute(const SetPasswordRoute());
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

  void attemptToPassData() async {
    Map<String, dynamic> bodyData = {
      StringConst.firstName: firstNameController.text,
      StringConst.lastName: lastNameController.text,
      StringConst.email: emailController.text,
      'role': 1
    };

    context.read<SeniorCubit>().attemptToRegisterSenior(bodyData);
    await attemptToSaveData();
  }

  Future<void> attemptToSaveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(StringConst.firstName, firstNameController.text);
    prefs.setString(StringConst.lastName, lastNameController.text);
    prefs.setString(StringConst.email, emailController.text);
  }
}
