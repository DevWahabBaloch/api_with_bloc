import 'package:api_with_bloc/config/routes/routes.dart';
import 'package:api_with_bloc/core/widget/app_multiblocprovider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _appRoute = AppRouter();
    return AppMultiBlocProvider(
      child: MaterialApp.router(
        routerConfig: _appRoute.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
