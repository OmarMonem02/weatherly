import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const String baseUrl = 'https://api.weatherapi.com/v1/current.json';
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
}