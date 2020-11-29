
import 'location.dart';
import 'networking.dart';

const baseUrl = "https://api.openweathermap.org/data/2.5/weather";
const apiKey = "f7b7aeb090fe9579d0d43a07baad7d26";

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    String apiURL = "$baseUrl?q=$cityName&appid=$apiKey&units=metric";

    NetworkHelper networkHelper = NetworkHelper(url: apiURL);
    var weatherData = await networkHelper.fetchWeatherData();
    return weatherData;
  }

  Future<dynamic> getWeatherlocation() async{
    LocationService locationService = LocationService();
    await locationService.getCurrentLocation();

    String apiURL = "$baseUrl?lat=${locationService.lon}&lon=${locationService.lat}&appid=$apiKey&units=metric";

    NetworkHelper networkHelper = NetworkHelper(url: apiURL);
    var weatherData = await networkHelper.fetchWeatherData();
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
    if (temp > 20) {
      return 'It\'s 🍦 time';
    } else if (temp > 15) {
      return 'Time for shorts and 👕';
    } else if (temp < 1) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
