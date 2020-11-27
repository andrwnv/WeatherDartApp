import 'package:flutter/material.dart';


class AppColorScheme {
  // Gradients.
  static final LinearGradient backgroudGradient = new LinearGradient(
    begin: Alignment.topCenter,
    end:   Alignment.bottomCenter,
    
    colors: [Color(0xFFB6C6FF), Color(0xFFBDA3F5)]
  );
  
  static final LinearGradient backgroudGradientAlternative = new LinearGradient(
    begin: Alignment.topCenter,
    end:   Alignment.bottomCenter,
    
    colors: [Color(0xFF1B1B1B), Color(0xFF515151)]
  ); 

  static final LinearGradient weatherWidgetBackground = new LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [Color(0xFFA282FF), Color(0xFF8D65FF)]
  );

  // Colors.
  static final Color mainColor = Color(0xFFFBFBFE);
  static final Color alternativeMainColor = Color(0xFFA282FF);

  static final Color mainFontColor = Color(0xFFFBFBFE);
  static final Color alternativeMainFontColor = Color(0xFFFBFBFE);
}
