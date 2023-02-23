import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();

  }

  //Creo el método
  //Y dentro se crea el objeto de la clase Location
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    //print(location.latitude);
    //print(location.longitude);
  }

  //Creando un nuevo método para obtener la info del http
  void getData() async {
    http.Response response= await  http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=0359c828acdd1faa944ac9e19b05fe3e'));

  if (response.statusCode == 200) {
    String data = response.body;
    print(data);
  }else {
    print(response.statusCode);
  }

  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();

  }
}
