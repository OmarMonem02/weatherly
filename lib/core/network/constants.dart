import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const String baseUrl = 'https://api.weatherapi.com/v1';
  static String apiKey = dotenv.get('API_KEY');
  static const String currentWeatherEndpoint = '/current.json';
}