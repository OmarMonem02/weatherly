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
  Future<WeatherModel> getWeather(String cityName) async {
    try {
      final remoteWeather = await remoteDataSource.getWeatherByCity(cityName);
      
      await localDataSource.cacheWeather(remoteWeather);
      
      return remoteWeather;
    } catch (e) {
      final cachedWeather = await localDataSource.getLastWeather();
      
      if (cachedWeather != null) {
        return cachedWeather;
      }
      
      rethrow;
    }
  }
}