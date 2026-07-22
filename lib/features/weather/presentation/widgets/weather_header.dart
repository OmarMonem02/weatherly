import 'package:flutter/material.dart';
import 'package:weatherly/core/theme/colors.dart';
import '../../data/models/weather_model.dart';

class WeatherHeader extends StatelessWidget {
  final WeatherModel weather;

  const WeatherHeader({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weather.cityName,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 34,
            fontWeight: FontWeight.w400,
          ),
        ),
        if (weather.country.isNotEmpty)
          Text(
            '${weather.region.isNotEmpty ? "${weather.region}, " : ""}${weather.country}',
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
        const SizedBox(height: 8),
        Text(
          '${weather.tempC.round()}°',
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 84,
            fontWeight: FontWeight.w200,
            height: 1,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (weather.iconUrl.isNotEmpty)
              Image.network(
                weather.iconUrl,
                width: 32,
                height: 32,
                errorBuilder: (_, __, ___) => const SizedBox(),
              ),
            const SizedBox(width: 6),
            Text(
              weather.conditionText,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        const SizedBox(height: 6),
        Text(
          'Feels like ${weather.feelslikeC.round()}°  •  Cloudiness: ${weather.cloud}%',
          style: const TextStyle(color: AppColors.textHint, fontSize: 13),
        ),
      ],
    );
  }
}