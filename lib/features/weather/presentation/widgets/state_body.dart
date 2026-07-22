import 'package:flutter/material.dart';
import 'package:weatherly/core/theme/colors.dart';
import 'package:weatherly/features/weather/presentation/bloc/weather_state.dart';
import 'package:weatherly/features/weather/presentation/widgets/weather_display_card.dart';

class StateBody extends StatelessWidget {
  const StateBody({
    super.key,
    required this.state,
  });

  final WeatherState state;

  @override
  Widget build(BuildContext context) {
    final state = this.state;
    if (state is WeatherLoading) {
      return const Padding(
        key: ValueKey('loading'),
        padding: EdgeInsets.symmetric(vertical: 60),
        child: Center(child: CircularProgressIndicator()),
      );
    } else if (state is WeatherSuccess) {
      return Padding(
        key: const ValueKey('success'),
        padding: EdgeInsets.zero,
        child: WeatherDisplayCard(weather: state.weather),
      );
    } else if (state is WeatherError) {
      return Container(
        key: const ValueKey('error'),
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.error.withValues(alpha: 0.1)),
        ),
        child: Row(
          children: [
            Icon(Icons.error_outline, color: AppColors.error),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                state.message,
                style: TextStyle(color: AppColors.error),
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      key: const ValueKey('empty'),
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          Icon(Icons.wb_cloudy_outlined, size: 72, color: AppColors.textHint),
          const SizedBox(height: 16),
          Text(
            'Search for a city to view the weather.',
            style: TextStyle(color: AppColors.textHint, fontSize: 15),
          ),
        ],
      ),
    );
  }
}