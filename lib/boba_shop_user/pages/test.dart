import 'package:flutter/material.dart';
import 'package:todo/_add/extra/widgets.dart';
import 'package:todo/backend/api_requests/weather/data_service.dart';
import 'package:todo/backend/api_requests/weather/models.dart';
import 'package:todo/_add/extra/theme.dart';
import 'package:go_router/go_router.dart';
import 'about_page.dart';
import 'home_page.dart';
import 'package:todo/boba_shop_user/models/shop.dart';
import 'package:provider/provider.dart';

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: unnecessary_null_comparison
              if (_response != null)
                Column(
                  children: [
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
                        labelStyle: TextStyle(color: Colors.white)),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ElevatedButton(onPressed: _search, child: Text('Search')),
              FFButtonWidget(
                  text: 'Go to Shop',
                  onPressed: () async {
                    context.pushNamed('BobaHome');
                  },
                  options: FFButtonOptions())
            ],
          ),
        ),
        backgroundColor: FlutterFlowTheme.of(context).primaryBlack,
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}
