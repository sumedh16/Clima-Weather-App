import 'package:flutter/material.dart';

const kBackgroundColor=Color.fromARGB(149, 18, 20, 49);

const kTempTextStyle = TextStyle(
  fontFamily: 'Raleway',
  fontSize: 68.0,
  fontWeight: FontWeight.bold,
);

const kAppTitleTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 38.0,
);

const kDescriptionText=TextStyle(
  fontSize: 24.0,
  fontFamily: 'Raleway',
  color: Color.fromARGB(255,81,82,94),
  fontWeight: FontWeight.bold,
);

const kBodyTitleText=TextStyle(
  fontSize: 21.0,
  fontFamily: 'Spartan MB',
  color: Colors.white,
);

const kWeatherDescriptionText=TextStyle(
  fontSize: 22.0,
  fontFamily: 'Raleway',
  color: Colors.white,
  fontWeight: FontWeight.bold
);

const kAttributeValuesText=TextStyle(
  fontSize: 20.0,
  fontFamily: 'Spartan MB',
  color: Colors.white
);

const kAttributeTitleText=TextStyle(
  // fontSize: 16.5,
  fontFamily: 'Raleway',
  color: Color.fromARGB(255, 166, 164, 164)
);
const kButtonTextStyle =
    TextStyle(fontSize: 30.0, fontFamily: 'Spartan MB', color: Colors.white);

const kConditionTextStyle = TextStyle(
  fontSize: 50.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none),
);
