import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/core/di/service_locator.dart';
import 'package:weatherly/core/theme/colors.dart';
import 'package:weatherly/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weatherly/features/weather/presentation/bloc/weather_event.dart';
import 'package:weatherly/features/weather/presentation/widgets/weather_info_cards.dart';
import 'package:weatherly/features/weather/presentation/widgets/weather_search_field.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  void _onSearch(BuildContext context) {
    final cityName = _cityController.text;
    if (cityName.isEmpty) return;
    FocusScope.of(context).unfocus();
    context.read<WeatherBloc>().add(FetchWeatherEvent(cityName: cityName));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<WeatherBloc>()..add(LoadLastSearchedCityEvent()),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.cardBg, AppColors.cardBg],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Builder(
              builder: (context) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: WeatherSearchField(
                        controller: _cityController,
                        onSearch: () => _onSearch(context),
                      ),
                    ),
                    WeatherInfoCards(cityController: _cityController),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
