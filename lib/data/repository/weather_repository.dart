import 'dart:convert';

import 'package:state_manager/data/provider/weather_data_provider.dart';
import 'package:state_manager/models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;
  WeatherRepository(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'Buea';
      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);
      print(WeatherModel.fromMap(data));

      if (data['cod'] != '200') {
        throw 'An unexpected error occured';
      }

      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
