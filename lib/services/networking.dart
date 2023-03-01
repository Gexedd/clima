import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;

      //Utilizo la función JsonDecode, importada del paquete DartConvert
      var decodedData = jsonDecode(data);
      return decodedData;

    } else {
      print(response.statusCode);
    }
  }
}
