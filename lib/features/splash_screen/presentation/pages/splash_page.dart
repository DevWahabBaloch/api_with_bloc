import 'package:api_with_bloc/config/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.pushRoute(const SeniorRoute());
              },
              child: const Text(
                'Senior',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.pushRoute(const CaregiverRoute());
              },
              child: const Text('Caregiver'),
            )
          ],
        ),
      ),
    );
  }
}
