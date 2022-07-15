// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen(this.locationWeather);
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int tempreture;
  late String weatherIcon;
  late String city;
  late String description;
  late String weatherMsg;
  late double windSpeed;
  late int cloudiness;
  late int humidity;
  WeatherModel weather = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        tempreture = 0;
        weatherIcon = 'Error';
        city = '';
        description = 'Unable to get weather data !';
        windSpeed=0;
        humidity=0;
       cloudiness=0;
        return;
      }

      double temp = weatherData['main']['temp'];
      tempreture = temp.toInt();
      var cond = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(cond);
      city = weatherData['name'];
      weatherMsg = weather.getMessage(tempreture);
      description=weatherData['weather'][0]['description'];
      windSpeed=weatherData['wind']['speed'];
      humidity=weatherData['main']['humidity'];
      cloudiness=weatherData['clouds']['all'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 34.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName =
                          await Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CityScreen();
                        },
                      ));
                      if (typedName != null) {
                        var weatherCityData =
                            await weather.getCityWeather(typedName);
                        updateUI(weatherCityData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 34.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.5,),
              Text(
                "Current Weather in '${city}'",
                style: kBodyTitleText,
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'images/first-image.jpg',
                height: 165.0,
                width: 180.0,
              ),
              Text('$description',
              style: kWeatherDescriptionText,
              textAlign: TextAlign.center,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$tempreture °',
                    style: kTempTextStyle,
                  ),
                  Text(
                    weatherIcon,
                    style: kConditionTextStyle,
                  ),
                ],
              ),
              SizedBox(height: 15.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(humidity.toString(),
                  style: kAttributeValuesText,),
                  Text(windSpeed.toString(),
                  style: kAttributeValuesText,),
                  Text(cloudiness.toString(),
                  style: kAttributeValuesText,),
                ],
              ),
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Humidity %',
                  style: kAttributeTitleText,),
                  Text('Wind Speed (km/hr)',
                  style: kAttributeTitleText,),
                  Text('Cloudiness %',
                  style: kAttributeTitleText,),
                ],
              )
            ],
            
          ),
        ),
      ),
    );
  }
}


// 