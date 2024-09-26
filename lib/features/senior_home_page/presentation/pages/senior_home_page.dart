import 'package:api_with_bloc/features/senior_home_page/data/model/senior_home_model.dart';
import 'package:api_with_bloc/features/senior_home_page/presentation/bloc/senior_home_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SeniorHomePage extends StatefulWidget {
  const SeniorHomePage({super.key});

  @override
  State<SeniorHomePage> createState() => _SeniorHomePageState();
}

class _SeniorHomePageState extends State<SeniorHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Senior Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<SeniorHomeCubit, SeniorHomeModel>(
              builder: (context, state) {
                context.read<SeniorHomeCubit>().attemptToLoadData();
                return Column(
                  children: [
                    Text(
                      'First Name : ${state.firstName}',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Last Name : ${state.lastName}',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Email : ${state.email}',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
