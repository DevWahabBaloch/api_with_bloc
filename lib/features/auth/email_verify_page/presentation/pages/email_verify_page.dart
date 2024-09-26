import 'dart:developer';

import 'package:api_with_bloc/config/routes/routes.gr.dart';
import 'package:api_with_bloc/core/constants/string_const.dart';
import 'package:api_with_bloc/features/auth/email_verify_page/presentation/bloc/email_verify_cubit.dart';
import 'package:api_with_bloc/features/auth/email_verify_page/presentation/bloc/email_verify_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class EmailVerifyPage extends StatefulWidget {
  const EmailVerifyPage({super.key});

  @override
  State<EmailVerifyPage> createState() => _EmailVerifyPageState();
}

class _EmailVerifyPageState extends State<EmailVerifyPage> {
  final TextEditingController pinController = TextEditingController();

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Verification'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter the verification code sent to your email',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            Pinput(
              length: 6,
              controller: pinController,
              defaultPinTheme: PinTheme(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onSubmitted: (value) {
                attemptToPassData();
              },
            ),
            const SizedBox(height: 20),
            BlocConsumer<EmailVerifyCubit, EmailVerifyState>(
                listener: (context, state) {
              if (state is LoadedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.responseMessage)));
                Future.delayed(const Duration(microseconds: 200), () {
                  context.pushRoute(const SeniorHomeRoute());
                });
              }
              if (state is FailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            }, builder: (context, state) {
              if (state is LoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              return ElevatedButton(
                onPressed: attemptToPassData,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Verify'),
              );
            })
          ],
        ),
      ),
    );
  }

  void attemptToPassData() {
    Map<String, dynamic> bodyData = {
      StringConst.verificationToken: pinController.text.trim(),
    };
    log('Sending data : $bodyData');
    context.read<EmailVerifyCubit>().attemptToRegisterVerifyEmail(bodyData);
  }
}
