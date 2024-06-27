import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/detail/widgets/detail_body.dart';
import 'package:weather_app/providers/weather_provider.dart';

import '../../models/weather.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff1D6CF3),
            Color(0xff19D2FE),
          ],
        ),
      ),
      child: FutureBuilder(
          future: context.read<WeatherProvider>().getWeatherDetail(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return Container(
                child: const Text('No data'),
              );
            }

            List<WeatherDetail> list = snapshot.data as List<WeatherDetail>;

            return Scaffold(
              appBar: AppBar(
                centerTitle: false,
                backgroundColor: Colors.transparent,
                title: Row(
                  children: [
                    const Icon((CupertinoIcons.location)),
                    const SizedBox(width: 10),
                    Text(context.read<WeatherProvider>().city,
                        style: const TextStyle(fontSize: 20)),
                  ],
                ),
                actions: const [
                  Icon(CupertinoIcons.search),
                  SizedBox(width: 10)
                ],
              ),
              body: DetailBody(list: list),
            );
          }),
    );
  }
}
