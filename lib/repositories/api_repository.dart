import 'package:dio/dio.dart';
import 'package:weather_app/app/utils/asset.dart';
import 'package:weather_app/models/weather.dart';

class ApiRepository {
  static Future<WeatherData> callApiGetWeather() async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=21.1273013&lon=106.1698566&units=metric&appid=${Mykey.api_token}');
      final data = res.data;
      WeatherData weatherData = WeatherData.fromMap(data);
      return weatherData;
    } catch (e) {
      rethrow;
    }
  }
}
