// import 'package:climate_app/screens/loading_screen.dart';
// import 'package:climate_app/services/networking.dart';
// import 'package:flutter/material.dart';

// class WeatherDescription extends ChangeNotifier
// {
//    String weatherDescription = "No Data Available Currently";

//    location_function() async {
//     await location.getCurrentLocation();
//     lat = location.latitude;
//     lon = location.longitude;
//     print(location.longitude);
//     print(location.latitude);
//         Networking networking_helpers = Networking(
//         URL:
//             'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$api_key');
//     var weatherData = await networking_helpers.API_Function();

//     weatherDescription =
//         weatherData['weather'][0]['description'];
//     print(weatherDescription) ;
//    }
// }