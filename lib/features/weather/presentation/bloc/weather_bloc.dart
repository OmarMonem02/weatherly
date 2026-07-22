import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/weather_repository.dart';
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;

  WeatherBloc({required this.repository}) : super(WeatherInitial()) {
    
    on<FetchWeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      final result = await repository.getWeatherByCity(event.cityName);
      result.fold(
        (failure) => emit(WeatherError(message: failure.message)),
        (weather) => emit(WeatherSuccess(weather: weather)),
      );
    });

    on<LoadLastSearchedCityEvent>((event, emit) async {
      final lastCity = repository.getLastCity();
      if (lastCity != null && lastCity.isNotEmpty) {
        add(FetchWeatherEvent(cityName: lastCity));
      }
    });
  }
}