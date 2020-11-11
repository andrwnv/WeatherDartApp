import 'package:flutter/material.dart';


class AppColorScheme {
  // Gradients.
  static final LinearGradient backgroudGradient = new LinearGradient(
    begin: Alignment.topCenter,
    end:   Alignment.bottomCenter,
    
    colors: [Color(0xB6C6FF), Color(0xBDA3F5)]
  );
  
  static final LinearGradient backgroudGradientAlternative = new LinearGradient(
    begin: Alignment.topCenter,
    end:   Alignment.bottomCenter,
    
    colors: [Color(0x1B1B1B), Color(0x515151)]
  ); 

  static final LinearGradient weatherWidgetBackground = new LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,

    colors: [Color(0xA282FF), Color(0x8D65FF)]
  );

  // Colors.
  static final Color mainColor = Color(0xFBFBFE);
  static final Color alternativeMainColor = Color(0xA282FF);

  static final Color mainFontColor = Color(0x9069FF);
  static final Color alternativeMainFontColor = Color(0xFBFBFE);
}
