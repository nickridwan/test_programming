import 'package:flutter/material.dart';
import 'package:test_programming_ridwan/models/student.dart';
import 'package:test_programming_ridwan/views/screens/detail.dart';
import 'package:test_programming_ridwan/views/screens/input.dart';
import 'package:test_programming_ridwan/views/theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<StudentModel> student = [];

  Future getData() async {
    student.clear();
    StudentModel.getStudent().then((value) {
      setState(() {
        for (var i = 0; i < value.length; i++) {
          student.add(value[i]);
        }
      });
    });
    return student;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // jika  menggunakan warna dari figma hasil warnanya berubah
        backgroundColor: kDarkBackgroundPrimaryColor,
        toolbarHeight: 151,
        title: const Text(
          "Data Siswa",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
        ),
        actions: const [
          Icon(
            Icons.search,
            size: 24.0,
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: student.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${student[index].name}",
                          style: TextStyle(color: Colors.black),
                        ),
                        IconButton(
                          onPressed: () {
                            showBottom();
                          },
                          icon: const Icon(
                            Icons.more_vert,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          child: Image.network(
                            "https://i.ibb.co/S32HNjD/no-image.jpg",
                            width: 65.0,
                            height: 75.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text("Jenis Kelamin"),
                                  Text(" : ${student[index].gender}"),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text("Tgl Lahir"),
                                  Text(" : ${student[index].bDate}"),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text("Provinsi"),
                                  Text(" : ${student[index].province}"),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text("Kota /  Kabupaten"),
                                  Text(" : ${student[index].city}"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  void showBottom() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: MediaQuery.of(context).size.height / 6,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(),
                          ));
                    },
                    child: Text(
                      "Detail",
                      style: blackTextStyle.copyWith(
                          fontWeight: bold, fontSize: 18),
                    ),
                    // ignore: prefer_const_constructors
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => addStudent(),
                            ));
                      },
                      child: Text(
                        "Edit",
                        style: blackTextStyle.copyWith(
                            fontWeight: bold, fontSize: 18),
                      )),
                ],
              ),
            ),
          );
        });
  }
}
