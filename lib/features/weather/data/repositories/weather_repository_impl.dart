import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_local_data_source.dart';
import '../datasources/weather_remote_data_source.dart';
import '../models/weather_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, WeatherModel>> getWeatherByCity(String cityName) async {
    try {
      final remoteWeather = await remoteDataSource.getWeatherByCity(cityName);
      
      await localDataSource.cacheWeather(remoteWeather);
      
      return Right(remoteWeather);
    } catch (e) {
      try {
        final cachedWeather = await localDataSource.getLastWeather();
        if (cachedWeather != null) {
          return Right(cachedWeather);
        }
      } catch (_) {
      }
      return const Left(ServerFailure(
        message: 'No internet connection and no cached data',
      ));
    }
  }

  @override
  String? getLastCity() {
    return localDataSource.getLastCity();
  }
}