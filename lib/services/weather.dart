import 'package:climate_app/services/location.dart';
import 'package:climate_app/services/networking.dart';



Location location = Location();
const api_key = 'ef6f0b62c842b40dd6c96b0ee99a68df';

Future<dynamic> CityLocation(String cityName) async {
  await location.getCurrentLocation();

  Networking networking_helpers = Networking(
      URL:
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$api_key&units=metric');
  var weatherData = await networking_helpers.API_Function();

  // weatherDescription = weatherData['weather'][0]['description'];
  return weatherData;
}
