import 'dart:convert';
import "package:http/http.dart" as http;

class StudentModel {
  String id;
  String name;
  String gender;
  String bDate;
  Object province;
  Object city;
  String photo;

  StudentModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.bDate,
    required this.province,
    required this.city,
    required this.photo,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        id: json["_id"],
        name: json["name"],
        gender: json["gender"],
        bDate: json["birthDate"],
        province: json["province"],
        city: json[""],
        photo: json["photo"],
      );

  static Future<List<StudentModel>> getStudent() async {
    String url = 'https://hiringmobile.qtera.co.id/students';
    final response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    final jsonObject = jsonDecode(response.body.toString());

    List<dynamic> list = (jsonObject as Map<String, dynamic>)['data'];
    List<StudentModel> student = [];
    for (int i = 0; i < list.length; i++) {
      student.add(StudentModel.fromJson(list[i]));
    }
    return student;
  }
}
