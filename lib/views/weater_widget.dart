import 'package:flutter/material.dart';

import 'package:weather_app/color_scheme.dart';
import 'package:weather_app/network/yandex_weather_api.dart';

class WeatherWidget extends StatefulWidget {
  WeatherWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WeatherWidget createState() => _WeatherWidget();
}

class _WeatherWidget extends State<WeatherWidget> {
  _WeatherWidget() {
    // _api.getForecasts(56.593795, 84.895908).then((value) => {
    //   _currentTemp = value[0].dayParts[0].tempAvg 
    // });
  }

  YandexWeatherApi _api = new YandexWeatherApi();

  int    _currentTemp = 24;
  
  String _currentLocality = 'Томск';
  String _currentCountry = 'Россия';

  String _currentWeather = 'Дождь';

  @override
  Widget build(BuildContext context) {
    return Container (
      decoration: BoxDecoration(
        gradient: AppColorScheme.weatherWidgetBackground
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 6, // 60%
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5, // 50%
                  child: Text(
                    '$_currentLocality, $_currentCountry',
                    style: TextStyle(
                      color: AppColorScheme.mainFontColor,
                      fontSize: 20
                    ),
                  ),
                ),
                Expanded(
                  flex: 5, // 50%
                  child: Column(
                    children: <Widget>[
                      Text(
                        '$_currentTemp' + ' \u2109',
                        style: TextStyle(
                          color: AppColorScheme.mainFontColor, 
                          fontSize: 48
                        ),
                      ),
                      Text(
                        '$_currentWeather'
                      )
                    ],
                  ),
                )
              ],
            )
          ),
          Expanded(
            flex: 4, // 40%
            child: Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.white.withOpacity(.2),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ),
                ]
              ),
              child: Icon(
                Icons.wb_sunny,
                size: 81,
              ),
            )
          ),
        ],
      ),
    );
  }
}
