import 'package:climate_app/screens/city_screen.dart';
import 'package:climate_app/services/location.dart';
import 'package:climate_app/services/weather.dart';
import 'package:climate_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  var location;

  LocationScreen({this.location});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temp = 25;
  int condition = 100;
  String cityname = "Aryaman Cinematic Universe";
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    Update_data(widget.location);
  }

  void Update_data(dynamic locaion) {
    setState(() {
      double temperature = locaion['main']['temp_min'];
      temp = temperature.toInt();
      condition = locaion['weather'][0]['id'];
      cityname = locaion['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Update_data(widget.location);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      String typedName = await Navigator.push(
                          (context),
                          MaterialPageRoute(
                            builder: (context) => CityScreen(),
                          ));
                      if (typedName != null) {
                        try {
                          var weaterData = await CityLocation(typedName);
                          Update_data(weaterData);
                        } catch (e) {
                          print(e);
                          var weaterData = await CityLocation(typedName);
                        Update_data(weaterData);
                        }
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      temp.toString() + '°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherModel.getWeatherIcon(condition),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  weatherModel.getMessage(temp) + ' in ' + cityname + '!',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
