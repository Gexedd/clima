import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

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

    print(location.latitude);
    print(location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
