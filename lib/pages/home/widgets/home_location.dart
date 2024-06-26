import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLocation extends StatelessWidget {
  HomeLocation({
    super.key,
    required this.location,
  });

  final String location;
  final df = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icons/location.png',
              width: 28,
            ),
            const SizedBox(width: 10),
            Text(
              location.toUpperCase(),
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          df.format(DateTime.now()).toString(),
          style: const TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
