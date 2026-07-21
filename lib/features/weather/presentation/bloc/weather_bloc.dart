import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/weather_repository.dart';
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;

  WeatherBloc({required this.repository}) : super(WeatherInitial()) {
    on<FetchWeatherEvent>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(
    FetchWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    if (event.cityName.trim().isEmpty) {
      emit(const WeatherError(message: 'Please enter the city name first.'));
      return;
    }

    emit(WeatherLoading());

    try {
      final weather = await repository.getWeather(event.cityName);
      emit(WeatherSuccess(weather: weather));
    } catch (e) {
      final cleanMessage = e.toString().replaceAll('Exception: ', '');
      emit(WeatherError(message: cleanMessage));
    }
  }
}