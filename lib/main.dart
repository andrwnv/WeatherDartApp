import 'package:flutter/material.dart';
import 'views/weater_widget.dart';
import 'views/weather_scroll_widget.dart';
import 'views/tool_bar.dart';
import 'color_scheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(gradient: AppColorScheme.backgroudGradient),
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: ToolBarWidget(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 30),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'TODAY',
                    style: TextStyle(
                        fontSize: 36,
                        color: AppColorScheme.mainFontColor,
                        fontFamily: 'Roboto-Medium'),
                  ),
                ),
              ),
              WeatherWidget(title: 'Flutter Demo Home Page'),
              Padding(
                padding: const EdgeInsets.only(top: 36.0),
                child: WeatherScrollWidget(
                  title: "aaa",
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    ));
  }
}
