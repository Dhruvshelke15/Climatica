import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'b3cf10ecffe24fc9b5b26c2dc83d6f21';
const openWeatherURL = 'http://api.weatherbit.io/v2.0/current/airquality';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    var url = '$openWeatherURL?city=$cityName&key=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper('$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&key=$apiKey');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getMessage(double temp) {
    if (temp < 50) {
      return 'Breathe fresh Air!';
    } else if (temp < 100) {
      return 'A little pollution.';
    } else if (temp < 150) {
      return 'Wear a mask!';
    } else if (temp < 200) {
      return 'Avoid going out!';
    } else if (temp < 300) {
      return 'Too dangerous for health!';
    } else {
      return 'Too much pollution for survival!‍';
    }
  }

  String getWeatherBackground(double temp) {
    if (temp < 50) {
      return 'clear.jpg';
    } else if (temp < 100) {
      return 'mist.jpg';
    } else if (temp < 150) {
      return 'haze.jpg';
    } else if (temp < 200) {
      return 'polluted.jpg';
    } else if (temp < 300) {
      return 'poll.jpg';
    } else if (temp < 500) {
      return 'damn.jpg‍';
    } else {
      return'thunderstorm.jpg';
    }
  }
}