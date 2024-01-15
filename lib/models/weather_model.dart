// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeatherModel {
  final double currentTemp;
  final String currentSky;
  final int currentPressure;
  final double currentWindSpeed;
  final int currentHumidity;
  final List<dynamic> hourlyWeather;

  WeatherModel(
      {required this.currentTemp,
      required this.currentSky,
      required this.currentPressure,
      required this.currentWindSpeed,
      required this.currentHumidity,
      required this.hourlyWeather});

  WeatherModel copyWith(
      {double? currentTemp,
      String? currentSky,
      int? currentPressure,
      double? currentWindSpeed,
      int? currentHumidity,
      List<dynamic>? hourlyWeather}) {
    return WeatherModel(
        currentTemp: currentTemp ?? this.currentTemp,
        currentSky: currentSky ?? this.currentSky,
        currentPressure: currentPressure ?? this.currentPressure,
        currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
        currentHumidity: currentHumidity ?? this.currentHumidity,
        hourlyWeather: hourlyWeather ?? this.hourlyWeather);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentTemp': currentTemp,
      'currentSky': currentSky,
      'currentPressure': currentPressure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
      'hourlyWeather': hourlyWeather
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeatherData = map['list'][0];
    print(currentWeatherData['main']['temp']);
    print(currentWeatherData['weather'][0]['description']);
    print(currentWeatherData['main']['pressure']);
    print(currentWeatherData['wind']['speed']);
    print(currentWeatherData['main']['humidity']);

    return WeatherModel(
        currentTemp: currentWeatherData['main']['temp'] as double,
        currentSky: currentWeatherData['weather'][0]['description'] as String,
        currentPressure: currentWeatherData['main']['pressure'] as int,
        currentWindSpeed: currentWeatherData['wind']['speed'] as double,
        currentHumidity: currentWeatherData['main']['humidity'] as int,
        hourlyWeather: map['list'] as dynamic);
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(currentTemp: $currentTemp, currentSky: $currentSky, currentPressure: $currentPressure, currentWindSpeed: $currentWindSpeed, currentHumidity: $currentHumidity, hourlyWeather: $hourlyWeather)';
  }

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;

    return other.currentTemp == currentTemp &&
        other.currentSky == currentSky &&
        other.currentPressure == currentPressure &&
        other.currentWindSpeed == currentWindSpeed &&
        other.currentHumidity == currentHumidity &&
        other.hourlyWeather == hourlyWeather;
  }

  @override
  int get hashCode {
    return currentTemp.hashCode ^
        currentSky.hashCode ^
        currentPressure.hashCode ^
        currentWindSpeed.hashCode ^
        currentHumidity.hashCode;
  }
}
