// ignore_for_file: avoid_print, use_key_in_widget_constructors, prefer_const_constructors, use_build_context_synchronously, library_private_types_in_public_api
import 'package:clima/screens/location_screen.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

const apiKey = 'c8a161d9cf1fad7a57ba890c7fe84f1f';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Image.asset(
              'images/weather-title.png',
              height: 200.0,
            ),
            SizedBox(height:8.0),
            Text(
              "Clima",
              style: kAppTitleTextStyle,
              textAlign: TextAlign.center,
            ),
            // Text('A Simple Weather App',
            // style: kSecondTitleText ,
            // textAlign: TextAlign.center,),
            SizedBox(height: 10.0,),
            Text(
              'Discover the Weather in Your City !',
              style: kDescriptionText,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50.0),          
            SpinKitFadingCircle(
              size: 75.0,
              color: Colors.grey,
            ),
          
          ],
        ),
      ),
    );
  }
}
