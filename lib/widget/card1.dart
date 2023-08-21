import 'dart:convert';
import 'package:api_wether/widget/card2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class card1 extends StatefulWidget {
  const card1(
      {super.key,
      required this.Contry,
      required this.temp,
      required this.city,
      required this.speed});
  final String Contry;
  final String temp;
  final String city;
  final String speed;

  @override
  State<card1> createState() => _card1State();
}

class _card1State extends State<card1> {
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
      print('API call failed with status code: ${response.statusCode}');
    }
  }

  Map<String, dynamic> data = {}; // To

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2d3340),
      appBar: AppBar(
        title: Text(
          widget.Contry,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xff2d3340),
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
              style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.city,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 30),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Wind",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
            SizedBox(
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
                SizedBox(
                  width: 5,
                ),
                Text(
                  "${widget.speed}m/s",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            card2(
              date: "Tue,Apr 14",
              image:
                  "assets/Image_05-02-1445_AH_at_9.55_PM-removebg-preview.png",
              temp: data["main"]["temp"].toString(),
            ),
            card2(
              date: "Wed,Apr 14",
              image:
                  "assets/Image_05-02-1445_AH_at_9.55_PM-removebg-preview.png",
              temp: data["main"]["temp"].toString(),
            ),
            card2(
              date: "Thu,Apr 14",
              image:
                  "assets/Image_05-02-1445_AH_at_9.55_PM-removebg-preview.png",
              temp: data["main"]["temp"].toString(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: card2(
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
