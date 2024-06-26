import 'package:flutter/material.dart';

class HomeDetailWeather extends StatelessWidget {
  const HomeDetailWeather({
    super.key,
    required this.wind,
    required this.humidity,
  });

  final num wind;
  final num humidity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset('assets/images/icons/wind.png'),
            Text(
              '${wind.round()}km/h',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            )
          ],
        ),
        Column(
          children: [
            Image.asset('assets/images/icons/humidity.png'),
            Text(
              '$humidity%',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            )
          ],
        )
      ],
    );
  }
}
