import 'package:flutter/material.dart';

import 'package:weather_app/color_scheme.dart';

import 'package:weather_app/network/weather_api_client.dart';
import 'package:weather_app/network/api_keys.dart';
import 'package:weather_app/models/weather.dart';

import 'package:http/http.dart' as http;

class WeatherScrollWidget extends StatefulWidget {
  WeatherScrollWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WeatherScrollWidget createState() => _WeatherScrollWidget();
}

class _WeatherScrollWidget extends State<WeatherScrollWidget> {
  _WeatherScrollWidget() {}

  Widget _hourlyWidget(String time, int deg, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Center(
        child: Container(
          constraints: BoxConstraints.expand(height: 120.0, width: 60.0),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('$time',
                        style: TextStyle(
                            color: AppColorScheme.mainFontColor,
                            fontSize: 16,
                            fontFamily: 'Roboto-Medium')),
                  )),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Icon(icon, size: 36, color: Colors.white),
                  )),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text('$deg' + '\u00B0',
                        style: TextStyle(
                            color: AppColorScheme.mainFontColor,
                            fontSize: 16,
                            fontFamily: 'Roboto-Medium')),
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
          constraints: BoxConstraints.expand(height: 70.0, width: 100.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, bottom: 7.0, left: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '$name',
                      style: TextStyle(
                          color: AppColorScheme.alternativeMainColor,
                          fontSize: 13,
                          fontFamily: 'Roboto-Medium'),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('$paramState ' + '$unitMark',
                        style: TextStyle(
                            color: AppColorScheme.alternativeMainColor,
                            fontSize: 20,
                            fontFamily: 'Roboto-Medium'))),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var weatherRepository = WeatherRepository(
        weatherApiClient: WeatherApiClient(
            httpClient: http.Client(), apiKey: ApiKey.OPEN_WEATHER_MAP));

    return FutureBuilder(
        future: weatherRepository.getWeather("London"),
        builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
          Widget children;

          if (snapshot.hasData) {
            snapshot.data.forecast.length = 9;

            children = Center(
              child: Container(
                constraints: BoxConstraints.expand(height: 300.0, width: 350.0),
                decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0xFF956BFF).withOpacity(0.22),
                        blurRadius: 20.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    gradient: new LinearGradient(colors: [
                      Colors.white.withOpacity(0.3),
                      Colors.transparent
                    ]),
                    borderRadius: new BorderRadius.all(Radius.circular(25))),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: NotificationListener<
                            OverscrollIndicatorNotification>(
                          // Dissable overscroll glow.
                          onNotification:
                              (OverscrollIndicatorNotification overscroll) {
                            overscroll.disallowGlow();
                            return;
                          },
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              for (var i in snapshot.data.forecast)
                                _hourlyWidget(
                                    '${DateTime.fromMillisecondsSinceEpoch(i.time * 1000).hour}:00',
                                    i.temperature.celsius.round(),
                                    i.getIconData())
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Details  >',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: AppColorScheme.mainFontColor,
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Bold'),
                            ),
                          ),
                        )),
                    Expanded(
                      flex: 3,
                      child: Container(
                          child: Row(
                        children: <Widget>[
                          _hourlyDetails(
                              "Humidity", snapshot.data.humidity, "%"),
                          _hourlyDetails("Wind Speed",
                              snapshot.data.windSpeed.toInt(), "m/s"),
                          _hourlyDetails("Fill Like",
                              snapshot.data.feelLike.celsius.floor(), '\u00B0'),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            );
          } else {
            children = CircularProgressIndicator();
          }

          return children;
        });
  }
}
