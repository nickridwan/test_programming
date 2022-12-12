import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//colors
Color kBlackColor = Colors.black;
Color kBlackAccentColor = Color(0xff161616);
Color kGreyColor = Color(0xff94959B);
Color kLineDarkColor = Color(0xffEAEAEA);
Color kWhiteGreyColor = Color(0xffF1F1F5);
Color kWhiteColor = Color(0xffFFFFFF);
Color kRedColor = Color(0xffFF0000);
Color kYellowColor = Color(0xffFFBA00);
Color kBlueColor = Colors.blue;
Color kDarkBackgroundPrimaryColor = Color(0xff1F1D2B);
Color kDarkBackgroundColor = Color(0xff252836);
Color kGreenColor = Colors.green;

//textstyle
TextStyle blackTextStyle = GoogleFonts.poppins(
  color: kBlackColor,
);
TextStyle blackAccentTextStyle = GoogleFonts.poppins(
  color: kBlackAccentColor,
);
TextStyle greyTextStyle = GoogleFonts.poppins(
  color: kGreyColor,
);
TextStyle lineDarkTextStyle = GoogleFonts.poppins(
  color: kLineDarkColor,
);
TextStyle whiteGreyTextStyle = GoogleFonts.poppins(
  color: kWhiteGreyColor,
);
TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: kWhiteColor,
);
TextStyle redTextStyle = GoogleFonts.poppins(
  color: kRedColor,
);
TextStyle yellowTextStyle = GoogleFonts.poppins(
  color: kYellowColor,
);
TextStyle blueTextStyle = GoogleFonts.poppins(
  color: kBlueColor,
);
TextStyle greenTextStyle = GoogleFonts.poppins(
  color: kGreenColor,
);

//fontweight
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

Label(String label) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    child: Text(
      label,
      style: blackAccentTextStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: kDarkBackgroundPrimaryColor,
      ),
    ),
  );
}
