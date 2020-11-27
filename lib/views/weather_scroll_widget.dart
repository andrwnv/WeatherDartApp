import 'package:flutter/material.dart';

import 'package:weather_app/color_scheme.dart';
import 'package:weather_app/network/yandex_weather_api.dart';

class WeatherScrollWidget extends StatefulWidget {
  WeatherScrollWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WeatherScrollWidget createState() => _WeatherScrollWidget();
}

class _WeatherScrollWidget extends State<WeatherScrollWidget> {
  _WeatherScrollWidget() {
    // _api.getForecasts(56.593795, 84.895908).then((value) => {
    //   _currentTemp = value[0].dayParts[0].tempAvg 
    // });
  }

  YandexWeatherApi _api = new YandexWeatherApi();

  int    _currentTemp = 24;
  
  String _currentLocality = 'Томск';
  String _currentCountry = 'Россия';

  String _currentWeather = 'Дождь';

  Widget _hourlyWidget(String time, int deg, int Weather) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Center(
        child: Container(
          constraints: BoxConstraints.expand(
              height: 120.0,
              width: 60.0
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: Column(
            children: <Widget>[
              Expanded(flex: 2, child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '$time', 
                  style: TextStyle(
                    color: AppColorScheme.mainFontColor, 
                    fontSize: 16)
                  ),
              )),
              Expanded(flex: 5, child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.wb_sunny, 
                  size: 36, 
                  color: Colors.white
                ),
              )),
              Expanded(flex: 3, child: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  '$deg' + '\u00B0', 
                  style: TextStyle(
                    color: AppColorScheme.mainFontColor, 
                    fontSize: 16
                    )
                  ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _hourlyDetails(String name, int paramState, String unitMark) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Center(
        child: Container(
          constraints: BoxConstraints.expand(
            height: 70.0,
            width: 100.0
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 7.0, left: 8),
                child: Align(
                  alignment: Alignment.centerLeft, 
                  child: Text(
                    '$name',
                    style: TextStyle(
                      color: AppColorScheme.alternativeMainColor,
                      fontSize: 13
                    ),
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Align(
                  alignment: Alignment.centerLeft, 
                  child: Text(
                    '$paramState ' + '$unitMark',
                    style: TextStyle(
                      color: AppColorScheme.alternativeMainColor,
                      fontSize: 20,
                    )
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container (
        constraints: BoxConstraints.expand(
          height: 300.0,
          width: 350.0
        ),
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xFF956BFF).withOpacity(0.22),
              blurRadius: 20.0,
              spreadRadius: 2.0,
            ),
          ],
          gradient: new LinearGradient(colors: [Colors.white.withOpacity(0.3), Colors.transparent]),
          borderRadius: new BorderRadius.all(Radius.circular(25))
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4, 
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: NotificationListener<OverscrollIndicatorNotification>( // Dissable overscroll glow.
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowGlow();
                    return ;
                  },
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      _hourlyWidget("9:00", 10, 10),
                      _hourlyWidget("10:00", 10, 10),
                      _hourlyWidget("11:00", 10, 10),
                      _hourlyWidget("12:00", 10, 10),
                      _hourlyWidget("13:00", 10, 10),
                      _hourlyWidget("14:00", 10, 10),
                      _hourlyWidget("15:00", 10, 10)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1, 
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Детали  >',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColorScheme.mainFontColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ),
            Expanded(
              flex: 3, 
              child: Container(
                  child: Row(
                      children: <Widget>[
                        _hourlyDetails("Влажность", 70, "%"),
                        _hourlyDetails("Влажность", 70, "%"),
                        _hourlyDetails("Влажность", 70, "%"),
                    ],
                  )
                ),
              ),
          ],
        ),
      ),
    );
  }
}
