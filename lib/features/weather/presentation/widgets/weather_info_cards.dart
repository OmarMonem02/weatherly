import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/core/theme/colors.dart';
import 'package:weatherly/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weatherly/features/weather/presentation/bloc/weather_state.dart';
import 'package:weatherly/features/weather/presentation/widgets/weather_header.dart';
import 'package:weatherly/features/weather/presentation/widgets/weather_info_card.dart';

class WeatherInfoCards extends StatelessWidget {
  const WeatherInfoCards({super.key, required this.cityController});

  final TextEditingController cityController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherSuccess) {
              cityController.text = state.weather.cityName;
            }
          },
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Padding(
                padding: EdgeInsets.only(top: 100),
                child: Center(
                  child: CircularProgressIndicator(color: AppColors.accentPurple),
                ),
              );
            } else if (state is WeatherSuccess) {
              final w = state.weather;
              return Column(
                children: [
                  const SizedBox(height: 10),
                  WeatherHeader(weather: w),
                  const SizedBox(height: 30),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 1.3,
                    children: [
                      WeatherInfoCard(
                        icon: Icons.wb_sunny_outlined,
                        title: 'UV Index',
                        value: '${w.uv}',
                        subValue: w.uv > 6
                            ? 'High'
                            : (w.uv > 2 ? 'Moderate' : 'Low'),
                      ),
                      WeatherInfoCard(
                        icon: Icons.air,
                        title: 'Wind',
                        value: '${w.windKph} km/h',
                        subValue: 'Direction: ${w.windDir}',
                      ),
                      WeatherInfoCard(
                        icon: Icons.water_drop_outlined,
                        title: 'Humidity',
                        value: '${w.humidity}%',
                        subValue: 'Dew point: ${w.dewpointC.round()}°',
                      ),
                      WeatherInfoCard(
                        icon: Icons.compress,
                        title: 'Pressure',
                        value: '${w.pressureMb.round()} hPa',
                      ),
                      WeatherInfoCard(
                        icon: Icons.umbrella_outlined,
                        title: 'Rainfall',
                        value: '${w.precipMm} mm',
                        subValue: 'Chance: ${w.chanceOfRain}%',
                      ),
                      WeatherInfoCard(
                        icon: Icons.visibility_outlined,
                        title: 'Visibility',
                        value: '${w.visKm} km',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              );
            } else if (state is WeatherError) {
              return Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.error.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.error.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: AppColors.error),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          state.message,
                          style: TextStyle(color: AppColors.textPrimary),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return const Padding(
              padding: EdgeInsets.only(top: 120),
              child: Center(
                child: Text(
                  'Search for a city to view weather details',
                  style: TextStyle(color: AppColors.textHint, fontSize: 16),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
