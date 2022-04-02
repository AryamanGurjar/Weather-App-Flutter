import 'package:climate_app/screens/location_screen.dart';
import 'package:climate_app/services/location.dart';
import 'package:climate_app/services/networking.dart';
import 'package:flutter/material.dart';

import 'package:rive/rive.dart';

Location location = Location();
const api_key = 'ef6f0b62c842b40dd6c96b0ee99a68df';
// double? lat, lon;
// String weatherDescription = "No Data Available Currently";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Future<void>.delayed(const Duration(microseconds: 2000), () {
      _showSnackbar();
    });

    super.initState();
    location_function();
  }

  void _showSnackbar() {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('content')));
  }

 

  location_function() async {
    await location.getCurrentLocation();

    Networking networking_helpers = Networking(
        URL:
            'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$api_key&units=metric');
    var weatherData = await networking_helpers.API_Function();

    // weatherDescription = weatherData['weather'][0]['description'];
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        location: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 48, 44, 44),
      body: Center(
        child: RiveAnimation.asset('rive/1902-3803-fetching-location.riv'),
        // child: CircularProgressIndicator(),
      ),
    );
  }
}
