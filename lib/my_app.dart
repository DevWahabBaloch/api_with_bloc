import 'package:api_with_bloc/config/routes/routes.dart';
import 'package:api_with_bloc/features/splash_screen/presentation/auth/caregiver_signup/presentation/bloc/caregiver_cubit.dart';
import 'package:api_with_bloc/features/splash_screen/presentation/auth/senior_signup/presentation/bloc/senior_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _appRoute = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider<CaregiverCubit>(
          create: (_) => CaregiverCubit()),
          BlocProvider<SeniorCubit>(
          create: (_) => SeniorCubit(),)

      ],
      child: MaterialApp.router(
        routerConfig: _appRoute.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
