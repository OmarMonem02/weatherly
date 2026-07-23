abstract class WeatherStatus {
  WeatherStatus._();

  static String getWeatherLottiePath(String condition) {
    final c = condition.toLowerCase();

    if (c.contains('thunder') ||
        c.contains('storm') ||
        c.contains('thundery') ||
        c.contains('blizzard')) {
      return 'assets/lottie/Weather-storm.json';
    }

    else if (c.contains('snow') ||
        c.contains('sleet') ||
        c.contains('ice') ||
        c.contains('pellets')) {
      return 'assets/lottie/Weather-snow.json';
    }

    else if (c.contains('rain') ||
        c.contains('drizzle') ||
        c.contains('shower')) {
      return 'assets/lottie/Weather-rainy.json';
    }

    else if (c.contains('wind') ||
        c.contains('dust') ||
        c.contains('sand') ||
        c.contains('haze') ||
        c.contains('smoke') ||
        c.contains('smog') ||
        c.contains('blowing')) {
      return 'assets/lottie/Weather-windy.json';
    }

    else if (c.contains('cloud') ||
        c.contains('overcast') ||
        c.contains('mist') ||
        c.contains('fog')) {
      return 'assets/lottie/Weather-cloudy.json';
    }

    return 'assets/lottie/Weather-sunny.json';
  }
}