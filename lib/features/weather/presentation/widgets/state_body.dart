import 'package:flutter/material.dart';
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
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.red.shade100),
        ),
        child: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.red.shade400),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                state.message,
                style: TextStyle(color: Colors.red.shade700),
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
          Icon(Icons.wb_cloudy_outlined, size: 72, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          Text(
            'Search for a city to view the weather.',
            style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
          ),
        ],
      ),
    );
  }
}