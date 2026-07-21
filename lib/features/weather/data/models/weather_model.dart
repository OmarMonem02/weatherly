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

  // تحويل الـ JSON الجاي من WeatherAPI إلى WeatherModel Object
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    // رابط الأيقونة بييجي من الـ API ببدء // فلابُد من إضافة https:
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

  // تحويل الـ Object لـ Map لسهولة تخزينه في الـ SharedPreferences (الكاش)
  Map<String, dynamic> toJson() {
    return {
      'location': {
        'name': cityName,
      },
      'current': {
        'temp_c': tempC,
        'condition': {
          'text': conditionText,
          'icon': iconUrl,
        },
      },
    };
  }

  @override
  List<Object?> get props => [cityName, tempC, conditionText, iconUrl];
}