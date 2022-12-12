import 'dart:convert';
import "package:http/http.dart" as http;

class ProvinceModel {
  String id;
  String name;

  ProvinceModel({
    required this.id,
    required this.name,
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
        id: json["_id"],
        name: json["name"],
      );

  static Future<List<ProvinceModel>> getProvince() async {
    String url = 'https://hiringmobile.qtera.co.id/province';
    final response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    final jsonObject = jsonDecode(response.body.toString());

    List<dynamic> list = (jsonObject as Map<String, dynamic>)['data'];
    List<ProvinceModel> province = [];
    for (int i = 0; i < list.length; i++) {
      province.add(ProvinceModel.fromJson(list[i]));
    }
    return province;
  }
}
