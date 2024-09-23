import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String baseUrl = '';

  static void init() {
    baseUrl = dotenv.get('BASE_URL');
  }
}