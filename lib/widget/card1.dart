import 'dart:convert';
import 'package:api_wether/widget/Card2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Card1 extends StatefulWidget {
  const Card1(
      {super.key,
      required this.contry,
      required this.temp,
      required this.city,
      required this.speed});
  final String contry;
  final String temp;
  final String city;
  final String speed;

  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=farasan&appid=edcbec8fc76186d12408307767401af1'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        data = jsonData; // Store the object data in the state
      });
    } else {
      Error();
    }
  }

  Map<String, dynamic> data = {}; // To

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2d3340),
      appBar: AppBar(
        title: Text(
          widget.contry,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff2d3340),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/Image_05-02-1445_AH_at_9.55_PM-removebg-preview.png",
              width: 100,
              height: 100,
            ),
            Text(
              widget.temp,
              style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.city,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 30),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Wind",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/Wind weather lines group symbol ⋆ Free Vectors, Logos, Icons and Photos Downloads.png",
                  color: Colors.white,
                  width: 30,
                  height: 30,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "${widget.speed}m/s",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Card2(
              date: "Tue,Apr 14",
              image:
                  "assets/Image_05-02-1445_AH_at_9.55_PM-removebg-preview.png",
              temp: data["main"]["temp"].toString(),
            ),
            Card2(
              date: "Wed,Apr 14",
              image:
                  "assets/Image_05-02-1445_AH_at_9.55_PM-removebg-preview.png",
              temp: data["main"]["temp"].toString(),
            ),
            Card2(
              date: "Thu,Apr 14",
              image:
                  "assets/Image_05-02-1445_AH_at_9.55_PM-removebg-preview.png",
              temp: data["main"]["temp"].toString(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Card2(
                date: "Fri,Apr 14",
                image:
                    "assets/Image_05-02-1445_AH_at_9.55_PM-removebg-preview.png",
                temp: data["main"]["temp"].toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
