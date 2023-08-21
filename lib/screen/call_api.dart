import 'dart:convert';
import 'package:api_wether/widget/card1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CallApi extends StatefulWidget {
  const CallApi({super.key});

  @override
  State<CallApi> createState() => _CallApiState();
}

class _CallApiState extends State<CallApi> {
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

  Map<String, dynamic> data = {}; // To store the object data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: card1(
        Contry: data["sys"]["country"] ?? "no data",
        temp: data["main"]["temp"].toString(),
        city: data["name"],
        speed: data["wind"]["speed"].toString(),
      ),
    );
  }
}
