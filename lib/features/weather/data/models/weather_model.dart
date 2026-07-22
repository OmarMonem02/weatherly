import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  // Location Data
  final String cityName;
  final String region;
  final String country;

  // Current Weather Data
  final double tempC;
  final double tempF;
  final String conditionText;
  final String iconUrl;
  final double windMph;
  final double windKph;
  final double windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double windchillC;
  final double windchillF;
  final double heatindexC;
  final double heatindexF;
  final double dewpointC;
  final double dewpointF;
  final double visKm;
  final double visMiles;
  final double uv;
  final double gustMph;
  final double gustKph;
  final int willItRain;
  final int chanceOfRain;
  final int willItSnow;
  final int chanceOfSnow;

  const WeatherModel({
    required this.cityName,
    required this.region,
    required this.country,
    required this.tempC,
    required this.tempF,
    required this.conditionText,
    required this.iconUrl,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    String rawIconUrl = json['current']?['condition']?['icon'] ?? '';
    if (rawIconUrl.startsWith('//')) {
      rawIconUrl = 'https:$rawIconUrl';
    }

    return WeatherModel(
      // Location
      cityName: json['location']?['name'] ?? '',
      region: json['location']?['region'] ?? '',
      country: json['location']?['country'] ?? '',

      // Current
      tempC: (json['current']?['temp_c'] as num?)?.toDouble() ?? 0.0,
      tempF: (json['current']?['temp_f'] as num?)?.toDouble() ?? 0.0,
      conditionText: json['current']?['condition']?['text'] ?? '',
      iconUrl: rawIconUrl,
      windMph: (json['current']?['wind_mph'] as num?)?.toDouble() ?? 0.0,
      windKph: (json['current']?['wind_kph'] as num?)?.toDouble() ?? 0.0,
      windDegree: (json['current']?['wind_degree'] as num?)?.toDouble() ?? 0.0,
      windDir: json['current']?['wind_dir'] ?? '',
      pressureMb: (json['current']?['pressure_mb'] as num?)?.toDouble() ?? 0.0,
      pressureIn: (json['current']?['pressure_in'] as num?)?.toDouble() ?? 0.0,
      precipMm: (json['current']?['precip_mm'] as num?)?.toDouble() ?? 0.0,
      precipIn: (json['current']?['precip_in'] as num?)?.toDouble() ?? 0.0,
      humidity: (json['current']?['humidity'] as num?)?.toInt() ?? 0,
      cloud: (json['current']?['cloud'] as num?)?.toInt() ?? 0,
      feelslikeC: (json['current']?['feelslike_c'] as num?)?.toDouble() ?? 0.0,
      feelslikeF: (json['current']?['feelslike_f'] as num?)?.toDouble() ?? 0.0,
      windchillC: (json['current']?['windchill_c'] as num?)?.toDouble() ?? 0.0,
      windchillF: (json['current']?['windchill_f'] as num?)?.toDouble() ?? 0.0,
      heatindexC: (json['current']?['heatindex_c'] as num?)?.toDouble() ?? 0.0,
      heatindexF: (json['current']?['heatindex_f'] as num?)?.toDouble() ?? 0.0,
      dewpointC: (json['current']?['dewpoint_c'] as num?)?.toDouble() ?? 0.0,
      dewpointF: (json['current']?['dewpoint_f'] as num?)?.toDouble() ?? 0.0,
      visKm: (json['current']?['vis_km'] as num?)?.toDouble() ?? 0.0,
      visMiles: (json['current']?['vis_miles'] as num?)?.toDouble() ?? 0.0,
      uv: (json['current']?['uv'] as num?)?.toDouble() ?? 0.0,
      gustMph: (json['current']?['gust_mph'] as num?)?.toDouble() ?? 0.0,
      gustKph: (json['current']?['gust_kph'] as num?)?.toDouble() ?? 0.0,
      willItRain: (json['current']?['will_it_rain'] as num?)?.toInt() ?? 0,
      chanceOfRain: (json['current']?['chance_of_rain'] as num?)?.toInt() ?? 0,
      willItSnow: (json['current']?['will_it_snow'] as num?)?.toInt() ?? 0,
      chanceOfSnow: (json['current']?['chance_of_snow'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': {'name': cityName, 'region': region, 'country': country},
      'current': {
        'temp_c': tempC,
        'temp_f': tempF,
        'condition': {'text': conditionText, 'icon': iconUrl},
        'wind_mph': windMph,
        'wind_kph': windKph,
        'wind_degree': windDegree,
        'wind_dir': windDir,
        'pressure_mb': pressureMb,
        'pressure_in': pressureIn,
        'precip_mm': precipMm,
        'precip_in': precipIn,
        'humidity': humidity,
        'cloud': cloud,
        'feelslike_c': feelslikeC,
        'feelslike_f': feelslikeF,
        'windchill_c': windchillC,
        'windchill_f': windchillF,
        'heatindex_c': heatindexC,
        'heatindex_f': heatindexF,
        'dewpoint_c': dewpointC,
        'dewpoint_f': dewpointF,
        'vis_km': visKm,
        'vis_miles': visMiles,
        'uv': uv,
        'gust_mph': gustMph,
        'gust_kph': gustKph,
        'will_it_rain': willItRain,
        'chance_of_rain': chanceOfRain,
        'will_it_snow': willItSnow,
        'chance_of_snow': chanceOfSnow,
      },
    };
  }

  @override
  List<Object?> get props => [
    cityName,
    region,
    country,
    tempC,
    tempF,
    conditionText,
    iconUrl,
    windMph,
    windKph,
    windDegree,
    windDir,
    pressureMb,
    pressureIn,
    precipMm,
    precipIn,
    humidity,
    cloud,
    feelslikeC,
    feelslikeF,
    windchillC,
    windchillF,
    heatindexC,
    heatindexF,
    dewpointC,
    dewpointF,
    visKm,
    visMiles,
    uv,
    gustMph,
    gustKph,
    willItRain,
    chanceOfRain,
    willItSnow,
    chanceOfSnow,
  ];
}
