import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test_programming_ridwan/models/province.dart';
import 'package:test_programming_ridwan/views/theme/theme.dart';
import 'package:test_programming_ridwan/views/widgets/calender.dart';
import 'package:test_programming_ridwan/views/widgets/textField.dart';
import "package:intl/intl.dart";

import '../../models/city.dart';

class addStudent extends StatefulWidget {
  const addStudent({Key? key}) : super(key: key);

  @override
  State<addStudent> createState() => _addStudentState();
}

class _addStudentState extends State<addStudent> {
  DateTime? _selectedDate;
  final nameController = TextEditingController();
  final lahirController = TextEditingController();
  List<ProvinceModel> _province = [];
  List<CityModel> _city = [];
  ProvinceModel? chooseProv;
  CityModel? chooseCity;
  File? image;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? ImagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    image = File(ImagePicked!.path);
    setState(() {});
  }

  Future getProvince() async {
    _province.clear();
    ProvinceModel.getProvince().then((value) {
      setState(() {
        for (var i = 0; i < value.length; i++) {
          _province.add(value[i]);
        }
      });
    });
    return _province;
  }

  Future getCity() async {
    _city.clear();
    CityModel.getCity().then((value) {
      setState(() {
        for (var i = 0; i < value.length; i++) {
          _city.add(value[i]);
        }
      });
    });
    return _city;
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    getProvince();
    getCity();
  }

  showCalender() async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime(2050),
    ).then((date) {
      setState(() {
        if (date != null && date != _selectedDate) {
          _selectedDate = date;
          lahirController.text = _selectedDate.toString();
          lahirController.text =
              DateFormat("y M d").format(_selectedDate!).toString();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkBackgroundPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24.0,
          ),
        ),
        title: const Text("Edit Data"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Informasi Dasar",
                style: blackTextStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              Label("Nama Lengkap"),
              buildFormField(nameController, "contoh: Ari Laso"),
              const SizedBox(
                height: 20,
              ),
              Label("Tanggal lahir"),
              getCalender(),
              const SizedBox(
                height: 20,
              ),
              Label("Provinsi"),
              selectedProvince(),
              const SizedBox(
                height: 20,
              ),
              Label("Kota / Kabupaten"),
              selectedCity(),
              const SizedBox(
                height: 20,
              ),
              Label("Upload Foto"),
              getProfile(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCalender() {
    return SizedBox(
      height: 60,
      child: TextFormField(
        style: blackAccentTextStyle,
        focusNode: AlwaysDisabledFocusNode(),
        controller: lahirController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1.1, color: kBlueColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kRedColor),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: "Masukan Tanggal Lahir",
          suffixIcon: const Icon(
            CupertinoIcons.calendar,
            size: 24.0,
          ),
          suffixStyle: whiteGreyTextStyle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        onTap: () {
          setState(() {
            showCalender();
          });
        },
      ),
    );
  }

  Widget getProfile() {
    return SizedBox(
      height: 60,
      child: TextFormField(
        style: blackAccentTextStyle,
        focusNode: AlwaysDisabledFocusNode(),
        controller: lahirController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1.1, color: kBlueColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kRedColor),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: "Upload Profile",
          suffixIcon: Row(
            children: const [
              Icon(
                CupertinoIcons.camera,
                size: 24.0,
              ),
            ],
          ),
          suffixStyle: whiteGreyTextStyle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        onTap: () {
          setState(() {
            getImage();
          });
        },
      ),
    );
  }

  Widget selectedProvince() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        underline: const Divider(),
        isExpanded: true,
        hint: Row(
          children: [
            SizedBox(width: 4),
            Expanded(
              child: Text(
                'Pilih Provinsi',
                style: TextStyle(
                  fontSize: 15,
                  color: kBlackColor,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: _province
            .map((item) => DropdownMenuItem<ProvinceModel>(
                  value: item,
                  child: Text(
                    item.name ?? "-",
                    style: blackAccentTextStyle.copyWith(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: chooseProv,
        onChanged: (value) {
          setState(() {
            chooseProv = value;
          });
        },
        icon: Icon(
          Icons.arrow_downward,
          color: kBlackColor,
        ),
        iconSize: 14,
        iconEnabledColor: kWhiteGreyColor,
        iconDisabledColor: Colors.white,
        buttonHeight: 60,
        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: kBlueColor,
          ),
        ),
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 200,
        // dropdownWidth: MediaQuery.of(context).size.width / 1.1,
        dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kDarkBackgroundPrimaryColor,
        ),
        dropdownElevation: 8,
      ),
    );
  }

  Widget selectedCity() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        underline: const Divider(),
        isExpanded: true,
        hint: Row(
          children: [
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                'Pilih Kota / Kabupaten',
                style: TextStyle(
                  fontSize: 15,
                  color: kBlackColor,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: _city
            .map((item) => DropdownMenuItem<CityModel>(
                  value: item,
                  child: Text(
                    item.name ?? "-",
                    style: blackAccentTextStyle.copyWith(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: chooseCity,
        onChanged: (value) {
          setState(() {
            chooseCity = value;
          });
        },
        icon: Icon(
          Icons.arrow_downward,
          color: kBlackColor,
        ),
        iconSize: 14,
        iconEnabledColor: kWhiteGreyColor,
        iconDisabledColor: Colors.white,
        buttonHeight: 60,
        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: kBlueColor,
          ),
        ),
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 200,
        dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kDarkBackgroundPrimaryColor,
        ),
        dropdownElevation: 8,
      ),
    );
  }
}
