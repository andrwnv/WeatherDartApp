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
    return  Center(
      child: Container (
        constraints: BoxConstraints.expand(
          height: 150.0,
          width: 350.0
        ),
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(.25),
              blurRadius: 13.0,
              spreadRadius: 2.0,
            ),
          ],
          gradient: AppColorScheme.weatherWidgetBackground,
          borderRadius: new BorderRadius.all(Radius.circular(25))
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 5, // 60%
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 5, // 50%
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        '$_currentLocality, $_currentCountry',
                        style: TextStyle(
                          color: AppColorScheme.mainFontColor,
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5, // 50%
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, bottom: 30.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '$_currentTemp' + '\u00B0',
                            style: TextStyle(
                              color: AppColorScheme.mainFontColor, 
                              fontSize: 48
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 20),
                            child: Text(
                              '$_currentWeather',
                              style: TextStyle(
                                color: AppColorScheme.mainFontColor, 
                                fontSize: 20
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ),
            Expanded(
              flex: 4, // 40%
              child: Container(
                child: Icon(
                  Icons.wb_sunny,
                  size: 81,
                  color: Color(0xFFFFF4F4),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
