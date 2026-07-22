import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final String cityName;
  final double tempC;
  final String conditionText;
  final String iconUrl;

  const WeatherModel({
    required this.cityName,
    required this.tempC,
    required this.conditionText,
    required this.iconUrl,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    String rawIconUrl = json['current']['condition']['icon'] ?? '';
    if (rawIconUrl.startsWith('//')) {
      rawIconUrl = 'https:$rawIconUrl';
    }

    return WeatherModel(
      cityName: json['location']['name'] ?? '',
      tempC: (json['current']['temp_c'] as num).toDouble(),
      conditionText: json['current']['condition']['text'] ?? '',
      iconUrl: rawIconUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': {'name': cityName},
      'current': {
        'temp_c': tempC,
        'condition': {'text': conditionText, 'icon': iconUrl},
      },
    };
  }

  @override
  List<Object?> get props => [cityName, tempC, conditionText, iconUrl];
}
