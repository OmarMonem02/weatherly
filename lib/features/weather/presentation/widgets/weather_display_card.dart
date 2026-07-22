import 'package:flutter/material.dart';
import 'package:weatherly/core/theme/colors.dart';
import '../../data/models/weather_model.dart';

class WeatherDisplayCard extends StatelessWidget {
  final WeatherModel weather;

  const WeatherDisplayCard({super.key, required this.weather});

  IconData _fallbackIconFor(String condition) {
    final c = condition.toLowerCase();
    if (c.contains('rain') || c.contains('drizzle')) return Icons.grain;
    if (c.contains('cloud')) return Icons.cloud;
    if (c.contains('storm') || c.contains('thunder')) return Icons.bolt;
    if (c.contains('snow')) return Icons.ac_unit;
    return Icons.wb_sunny;
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.getWeatherGradient(weather.conditionText);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1 - value) * 16),
            child: child,
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors.colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: colors.colors.last.withValues(alpha: 0.4),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on, color: Colors.white70, size: 18),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    "${weather.cityName}, ${weather.region}, ${weather.country}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 130,
              width: 130,
              child: weather.iconUrl.isNotEmpty
                  ? Image.network(
                      weather.iconUrl,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return const Center(
                          child: SizedBox(
                            width: 32,
                            height: 32,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (_, __, ___) => Icon(
                        _fallbackIconFor(weather.conditionText),
                        size: 80,
                        color: AppColors.textPrimary,
                      ),
                    )
                  : Icon(
                      _fallbackIconFor(weather.conditionText),
                      size: 80,
                      color: AppColors.textPrimary,
                    ),
            ),
            const SizedBox(height: 8),
            Text(
              '${weather.tempC.round()}°',
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 64,
                fontWeight: FontWeight.w200,
                height: 1,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.textPrimary.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                weather.conditionText,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}