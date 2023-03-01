import 'package:geolocator/geolocator.dart';

class Location {
  double latitude=0;
  double longitude=0;

  Future<void> getCurrentLocation() async {

    LocationPermission permission = await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high); //Esta instrucción se obtiene del paquete geolocator en la web
      print ('prueba de   +$permission');
      //  print('prueba de  $position');

      latitude=position.latitude;
      longitude=position.longitude;

    } catch (e) {
      print (e);
    }
  }
}