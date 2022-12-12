import 'package:flutter/material.dart';
import 'package:test_programming_ridwan/views/theme/theme.dart';

Widget buildFormField(
  TextEditingController controller,
  String hint,
) {
  return SizedBox(
    height: 60,
    child: TextFormField(
      style: blackAccentTextStyle.copyWith(fontWeight: medium, fontSize: 15),
      keyboardType: TextInputType.name,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1.1, color: kBlueColor),
        ),
        hintText: hint,
        hintStyle:
            blackAccentTextStyle.copyWith(fontWeight: medium, fontSize: 15),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    ),
  );
}
