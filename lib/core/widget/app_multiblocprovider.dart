import 'package:api_with_bloc/features/auth/caregiver_signup/presentation/bloc/caregiver_cubit.dart';
import 'package:api_with_bloc/features/auth/email_verify_page/presentation/bloc/email_verify_cubit.dart';
import 'package:api_with_bloc/features/auth/senior_signup/presentation/bloc/senior_cubit.dart';
import 'package:api_with_bloc/features/auth/set_password/presentation/bloc/set_password_cubit.dart';
import 'package:api_with_bloc/features/senior_home_page/presentation/bloc/senior_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppMultiBlocProvider extends StatelessWidget {
  final Widget child;
  const AppMultiBlocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CaregiverCubit>(create: (_) => CaregiverCubit()),
        BlocProvider<SeniorCubit>(
          create: (_) => SeniorCubit(),
        ),
        BlocProvider<SetPasswordCubit>(create: (_) => SetPasswordCubit()),
        BlocProvider<EmailVerifyCubit>(create: (_) => EmailVerifyCubit()),
        BlocProvider<SeniorHomeCubit>(create: (_) => SeniorHomeCubit()),
      ],
      child: child,
    );
  }
}
