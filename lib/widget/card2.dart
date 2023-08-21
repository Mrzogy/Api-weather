import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  const Card2({
    super.key,
    required this.date,
    required this.image,
    required this.temp,
  });
  final String date;
  final String image;
  final String temp;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          date,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w300, color: Colors.white),
        ),
        const SizedBox(
          width: 80,
        ),
        Image.asset(
          image,
          width: 50,
          height: 50,
        ),
        const SizedBox(
          width: 100,
        ),
        Text(
          temp,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w300, color: Colors.white),
        ),
      ],
    );
  }
}
