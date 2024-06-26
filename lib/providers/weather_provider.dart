import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

import '../repositories/api_repository.dart';

class WeatherProvider extends ChangeNotifier {
  Future<WeatherData> getWeatherCurrent() async {
    WeatherData result = await ApiRepository.callApiGetWeather();
    return result;
  }
}
