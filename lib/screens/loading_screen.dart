import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey ='0359c828acdd1faa944ac9e19b05fe3e';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude=0;
  double longitude=0;

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

    latitude =location.latitude;
    longitude=location.longitude;

    getData();
  }

  //Creando un nuevo método para obtener la info del http
  void getData() async {
    http.Response response= await  http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));

  if (response.statusCode == 200) {
    String data = response.body;


    //Utilizo la función JsonDecode, importada del paquete DartConvert
    var longitude = jsonDecode(data)['coord']['lon'];


    var temp = jsonDecode(data)['main']['temp'];
    var condition =jsonDecode(data)['weather'][0]['id'];
    var cityName =jsonDecode(data)['name'];

    print(longitude);
    print(temp);
    print(condition);
    print(cityName);

  }else {
    print(response.statusCode);
  }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold();

  }
}
