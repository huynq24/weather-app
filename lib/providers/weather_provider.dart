import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather.dart';

import '../repositories/api_repository.dart';

class WeatherProvider extends ChangeNotifier {
  Position? position;
  String city = '';
  updatePosition(Position positionCurrent) {
    position = positionCurrent;
    notifyListeners();
  }

  Future<WeatherData> getWeatherCurrent() async {
    WeatherData result = await ApiRepository.callApiGetWeather(position);
    city = result.name;
    notifyListeners();
    return result;
  }

  Future<List<WeatherDetail>> getWeatherDetail() async {
    List<WeatherDetail> result =
        await ApiRepository.callApiGetWeatherDetail(position);
    return result;
  }
}
