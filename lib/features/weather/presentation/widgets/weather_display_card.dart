import 'package:flutter/material.dart';
import '../../data/models/weather_model.dart';

class WeatherDisplayCard extends StatelessWidget {
  final WeatherModel weather;

  const WeatherDisplayCard({super.key, required this.weather});

  List<Color> _gradientFor(String condition) {
    final c = condition.toLowerCase();
    if (c.contains('rain') || c.contains('drizzle')) {
      return [const Color(0xFF3A6073), const Color(0xFF16222A)];
    } else if (c.contains('cloud') || c.contains('overcast')) {
      return [const Color(0xFF757F9A), const Color(0xFFD7DDE8)];
    } else if (c.contains('storm') || c.contains('thunder')) {
      return [const Color(0xFF232526), const Color(0xFF414345)];
    } else if (c.contains('snow')) {
      return [const Color(0xFF83A4D4), const Color(0xFFB6FBFF)];
    } else if (c.contains('clear') || c.contains('sun')) {
      return [const Color(0xFFFF9A56), const Color(0xFFFF6B95)];
    }
    return [Colors.deepPurple.shade400, Colors.deepPurple.shade700];
  }

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
    final colors = _gradientFor(weather.conditionText);

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
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: colors.last.withOpacity(0.4),
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
                    weather.cityName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
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
                              color: Colors.white70,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (_, __, ___) => Icon(
                        _fallbackIconFor(weather.conditionText),
                        size: 80,
                        color: Colors.white,
                      ),
                    )
                  : Icon(
                      _fallbackIconFor(weather.conditionText),
                      size: 80,
                      color: Colors.white,
                    ),
            ),
            const SizedBox(height: 8),
            Text(
              '${weather.tempC.round()}°',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 64,
                fontWeight: FontWeight.w200,
                height: 1,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.18),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                weather.conditionText,
                style: const TextStyle(
                  color: Colors.white,
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