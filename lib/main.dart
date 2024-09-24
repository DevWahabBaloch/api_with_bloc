
import 'package:api_with_bloc/config/env/env.dart';
import 'package:api_with_bloc/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  Env.init();

  runApp(const MyApp());
}
