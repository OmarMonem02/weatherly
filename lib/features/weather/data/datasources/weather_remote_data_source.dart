import 'package:dio/dio.dart';
import 'package:weatherly/core/network/constants.dart';
import '../models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeatherByCity(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio dio;

  WeatherRemoteDataSourceImpl({required this.dio});

  @override
  Future<WeatherModel> getWeatherByCity(String cityName) async {
    try {
      final response = await dio.get(
        ApiConstants.currentWeatherEndpoint,
        queryParameters: {
          'key': ApiConstants.apiKey,
          'q': cityName,
        },
      );

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception('An error occurred while retrieving data.');
      }
    } on DioException catch (e) {
      if (e.response != null && e.response?.statusCode == 400) {
        throw Exception('The city name is incorrect, please check and try again.');
      }
      throw Exception('Unable to connect to the server, check your internet connection.');
    }
  }
}