import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

Widget getCalender(TextEditingController controller, void show) {
  return SizedBox(
    height: 60,
    child: TextFormField(
      style: whiteGreyTextStyle,
      focusNode: AlwaysDisabledFocusNode(),
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1.1, color: kBlueColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kRedColor),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: "masukan tgl lahir",
        hintStyle: whiteTextStyle.copyWith(fontWeight: medium, fontSize: 15),
        suffixIcon: const Icon(
          CupertinoIcons.calendar,
          size: 24.0,
        ),
        suffixStyle: whiteGreyTextStyle,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onTap: () {
        show;
      },
    ),
  );
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
