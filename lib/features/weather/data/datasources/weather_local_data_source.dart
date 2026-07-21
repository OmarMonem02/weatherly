import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/weather_model.dart';

abstract class WeatherLocalDataSource {
  Future<void> cacheWeather(WeatherModel weather);
  Future<WeatherModel?> getLastWeather();
}

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String cachedWeatherKey = 'CACHED_WEATHER_DATA';

  WeatherLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheWeather(WeatherModel weather) async {
    final jsonString = jsonEncode(weather.toJson());
    await sharedPreferences.setString(cachedWeatherKey, jsonString);
  }

  @override
  Future<WeatherModel?> getLastWeather() async {
    final jsonString = sharedPreferences.getString(cachedWeatherKey);
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return WeatherModel.fromJson(jsonMap);
    }
    return null;
  }
}