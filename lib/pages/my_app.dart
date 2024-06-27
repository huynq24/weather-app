import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/config/theme_custom.dart';
import 'package:weather_app/pages/bottom_navigation/bottom_custom.dart';

import '../providers/weather_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.position});

  final Position position;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherProvider()..updatePosition(position),
      child: MaterialApp(
        theme: ThemeCustom.themeLight,
        debugShowCheckedModeBanner: false,
        home: const BottomCustom(),
      ),
    );
  }
}
