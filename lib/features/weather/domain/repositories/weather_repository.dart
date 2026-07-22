import 'package:dartz/dartz.dart';
import 'package:weatherly/core/error/failures.dart';
import 'package:weatherly/features/weather/data/models/weather_model.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherModel>> getWeatherByCity(String cityName);
  String? getLastCity();
}