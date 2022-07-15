import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'c8a161d9cf1fad7a57ba890c7fe84f1f';
const urlHelper = 'https://api.openweathermap.org/data/2.5/weather?';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    
    var url='${urlHelper}q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper=NetworkHelper(url);
    var weatherData=await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location currentLocation = Location();

    await currentLocation.getLocation();
    NetworkHelper newtworkHelper = NetworkHelper(
        '${urlHelper}lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&appid=$apiKey&units=metric');
    var weatherData = await newtworkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
