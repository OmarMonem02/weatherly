import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherly/core/network/dio_client.dart';
import 'package:weatherly/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:weatherly/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weatherly/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weatherly/features/weather/domain/repositories/weather_repository.dart';
import 'package:weatherly/features/weather/presentation/bloc/weather_bloc.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // 1. External and Core Services
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<DioClient>(() => DioClient(sl()));

  // 2. Data Sources
  sl.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<WeatherLocalDataSource>(
    () => WeatherLocalDataSourceImpl(sharedPreferences: sl()),
  );
  
  // 3. Repository
  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  // 4. BLoC
  sl.registerFactory(
    () => WeatherBloc(repository: sl()),
  );
}