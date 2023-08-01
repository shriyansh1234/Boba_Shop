import 'package:flutter/material.dart';
import 'package:todo/_add/extra/widgets.dart';
import 'package:todo/backend/api_requests/weather/data_service.dart';
import 'package:todo/backend/api_requests/weather/models.dart';
import 'package:todo/_add/extra/theme.dart';
import 'package:go_router/go_router.dart';
import '../constants/const.dart';


class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _response;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: unnecessary_null_comparison
              if (_response != null)
                Column(
                  children: [
                    Text('The current temperature is:',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    Text(
                      '${_response?.tempInfo.temperature}°',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ],
                ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _cityTextController,
                    decoration: InputDecoration(
                        labelText: ' Please Enter Your City',
                        labelStyle: TextStyle(fontSize: 15, color: Colors.white)),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _search,
                child: Text('Search', style: TextStyle(fontSize: 15, color: Colors.white)),
              ),
              FFButtonWidget(
                  text: 'Go to Shop',
                  onPressed: () async {
                    context.pushNamed('BobaHome');
                  },
                  options: FFButtonOptions(textStyle: TextStyle(fontSize: 15, color: Colors.white)))
            ],
          ),
        ),
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}
