import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '0359c828acdd1faa944ac9e19b05fe3e';
const openWeatherMapURL ='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    //Creo el mÃ©todo
    //Y dentro se crea el objeto de la clase Location

      Location location = Location();
      await location.getCurrentLocation();

      NetworkHelper networkHelper = NetworkHelper(
          '$openWeatherMapURL?lat=${location.latitude}&lon=${location
              .longitude}&appid=$apiKey&units=metric');

      var weatherData = await networkHelper.getData();
      return weatherData;

    }

    String getWeatherIcon(int condition) {
      if (condition < 300) {
        return 'ð©';
      } else if (condition < 400) {
        return 'ð§';
      } else if (condition < 600) {
        return 'âï¸';
      } else if (condition < 700) {
        return 'âï¸';
      } else if (condition < 800) {
        return 'ð«';
      } else if (condition == 800) {
        return 'âï¸';
      } else if (condition <= 804) {
        return 'âï¸';
      } else {
        return 'ð¤·';
      }
    }

    String getMessage(int temp) {
      if (temp > 25) {
        return 'It\'s ð¦ time';
      } else if (temp > 20) {
        return 'Time for shorts and ð';
      } else if (temp < 10) {
        return 'You\'ll need ð§£ and ð§¤';
      } else {
        return 'Bring a ð§¥ just in case';
      }
    }
  }
