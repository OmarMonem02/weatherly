import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherly/core/theme/colors.dart';
import 'package:weatherly/core/theme/fonts.dart';
import '../../data/models/weather_model.dart';
import '../utils/weather_status.dart';

class WeatherHeader extends StatelessWidget {
  final WeatherModel weather;

  const WeatherHeader({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final lottiePath = WeatherStatus.getWeatherLottiePath(weather.conditionText);

    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.directional(
              textDirection: TextDirection.ltr,
              start: 120,
              end: 0,
              top: 0,
              bottom: 100,
              child: Lottie.asset(
                lottiePath,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const SizedBox(),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.cardBg.withValues(alpha: 0.1),
                      AppColors.cardBg.withValues(alpha: 0.1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    weather.cityName,
                    style: RobotoFonts.headline4.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                      shadows: const [
                        Shadow(color: Colors.black45, blurRadius: 10),
                      ],
                    ),
                  ),
                  if (weather.country.isNotEmpty)
                    Text(
                      '${weather.region.isNotEmpty ? "${weather.region}, " : ""}${weather.country}',
                      style: RobotoFonts.body2.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  const SizedBox(height: 12),
                  Text(
                    '${weather.tempC.round()}°',
                    style: RobotoFonts.headline1.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 84,
                      fontWeight: FontWeight.w700,
                      height: 1,
                      shadows: const [
                        Shadow(color: Colors.black45, blurRadius: 12),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (weather.iconUrl.isNotEmpty)
                        Image.network(
                          weather.iconUrl,
                          width: 60,
                          height: 60,
                          errorBuilder: (_, __, ___) => const SizedBox(),
                        ),
                      const SizedBox(width: 8),
                      Text(
                        weather.conditionText,
                        style: RobotoFonts.headline6.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.35),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white12),
                    ),
                    child: Text(
                      'Feels like ${weather.feelslikeC.round()}°  •  Cloudiness: ${weather.cloud}%',
                      style: RobotoFonts.body2.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
