import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/app/utils/asset.dart';
import 'package:weather_app/models/weather.dart';

class ApiRepository {
  static Future<WeatherData> callApiGetWeather(Position? position) async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=${position?.latitude}&lon=${position?.longitude}&units=metric&appid=${Mykey.api_token}');
      final data = res.data;
      WeatherData weatherData = WeatherData.fromMap(data);
      return weatherData;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<WeatherDetail>> callApiGetWeatherDetail(
      Position? position) async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/forecast?lat=${position?.latitude}&lon=${position?.longitude}&units=metric&appid=${Mykey.api_token}');
      List data = res.data['list'];
      List<WeatherDetail> list = List<WeatherDetail>.from(
          data.map((e) => WeatherDetail.fromMap(e)).toList());
      return list;
    } catch (e) {
      rethrow;
    }
  }
}
