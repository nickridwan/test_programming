import 'dart:convert';
import "package:http/http.dart" as http;

class CityModel {
  String id;
  String name;
  String province;

  CityModel({
    required this.id,
    required this.name,
    required this.province,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json["_id"],
        name: json["name"],
        province: json["province"],
      );

  static Future<List<CityModel>> getCity() async {
    String url = 'https://hiringmobile.qtera.co.id/city';
    final response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    final jsonObject = jsonDecode(response.body.toString());

    List<dynamic> list = (jsonObject as Map<String, dynamic>)['data'];
    List<CityModel> city = [];
    for (int i = 0; i < list.length; i++) {
      city.add(CityModel.fromJson(list[i]));
    }
    return city;
  }
}
