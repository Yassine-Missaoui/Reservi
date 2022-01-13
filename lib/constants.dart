import 'package:flutter/material.dart';

final kFirstColor = Color(0xFFF1F7EE);
//final kSecondColor  = Color(0xFFFF715B);
final kSecondColor  = Color(0xFF534B62);
final kThirdColor   = Color(0xFF534B62);
final kFourthColor  = Color(0xFF6F7EAE);
//final kFourthColor  = Color(0xFFF3B700);


/// Hint Text Style ///
final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'MunichBlack',
);


/// Screen Design : BoxDecoration Style ///
final kBoxDecoration =BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Colors.black,kFourthColor],
    stops: [0.3,0.7],
  ),
);

final kTitleStyle = TextStyle(
  color: kFirstColor,
  fontFamily: 'MulishBlack',
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 3.0,
);

final SecondTitleTextStyle = TextStyle(
  color: kFirstColor,
  fontFamily: 'MunishBlack',
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.5
);

/// Special words ///
final kLabelStyle = TextStyle(
  color: kFirstColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'RobotoMono',
);

/// input shape style ( form ) ///
final inputBoxDecorationStyle = BoxDecoration(
  color: kFourthColor ,
  borderRadius: BorderRadius.circular(20.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

/// Normal Text Style ///
final normalTextStyle = TextStyle(
  color: kFirstColor,
  fontFamily: 'RobotoMono',
);

/// Login Button Text Style ///
final LoginButtonTextStyle = TextStyle(
  color: kFourthColor,
  letterSpacing: 2.0,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'MunichBlack',
);

TextStyle customTextStyle1 = const TextStyle(
  fontWeight: FontWeight.w500,
  letterSpacing: 2.0,
  fontFamily: 'MulishBlack',
  fontSize: 16.0,
);

TextStyle customTextStyle2 = const TextStyle(
  fontWeight: FontWeight.w500,
  letterSpacing: 1,
  fontFamily: 'RobotoMono',
  fontSize: 16.0,
  color: Colors.black87,
);

TextStyle customTextStyle3 = TextStyle(
  fontWeight: FontWeight.w500,
  letterSpacing: 1,
  fontFamily: 'RobotoMono',
  fontSize: 14.0,
  color: kSecondColor,
);

TextStyle customTextStyle4 = TextStyle(
  fontWeight: FontWeight.w700,
  letterSpacing: 1,
  fontFamily: 'RobotoMono',
  fontSize: 14.0,
  color: kFirstColor,
);