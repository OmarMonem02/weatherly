import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/weather_model.dart';

abstract class WeatherLocalDataSource {
  Future<void> cacheWeather(WeatherModel weather);
  Future<WeatherModel?> getLastWeather();
  Future<void> cacheLastCity(String cityName);
  String? getLastCity();
}

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;

  static const String cachedWeatherKey = 'CACHED_WEATHER';
  static const String lastCityKey = 'LAST_CITY';

  WeatherLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheWeather(WeatherModel weather) async {
    await sharedPreferences.setString(cachedWeatherKey, jsonEncode(weather.toJson()));
    await cacheLastCity(weather.cityName);
  }

  @override
  Future<WeatherModel?> getLastWeather() async {
    final jsonString = sharedPreferences.getString(cachedWeatherKey);
    if (jsonString != null) {
      return WeatherModel.fromJson(jsonDecode(jsonString));
    }
    return null;
  }

  @override
  Future<void> cacheLastCity(String cityName) async {
    await sharedPreferences.setString(lastCityKey, cityName);
  }

  @override
  String? getLastCity() {
    return sharedPreferences.getString(lastCityKey);
  }
}