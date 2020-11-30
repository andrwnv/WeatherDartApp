import 'package:flutter/material.dart';

import 'package:weather_app/color_scheme.dart';
import 'package:weather_app/network/weather_api_client.dart';
import 'package:weather_app/network/api_keys.dart';
import 'package:weather_app/models/weather.dart';

import 'package:http/http.dart' as http;

class WeatherWidget extends StatefulWidget {
  WeatherWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WeatherWidget createState() => _WeatherWidget();
}

class _WeatherWidget extends State<WeatherWidget> {
  _WeatherWidget() {
    weatherRepository = WeatherRepository(
        weatherApiClient: WeatherApiClient(
            httpClient: http.Client(), apiKey: ApiKey.OPEN_WEATHER_MAP));

    weatherRepository.getWeather("Tomsk").then((value) {
      _weather = value;
    });
  }

  WeatherRepository weatherRepository;
  Weather _weather;

  int _currentTemp = 24;

  String _currentLocality = 'Томск';
  String _currentCountry = 'Россия';

  String _currentWeather = 'Дождь';

  @override
  Widget build(BuildContext context) {
    weatherRepository = WeatherRepository(
        weatherApiClient: WeatherApiClient(
            httpClient: http.Client(), apiKey: ApiKey.OPEN_WEATHER_MAP));

    // weatherRepository.getWeather("Tomsk").then((value) { _weather = value; });
    // var temp = _weather.temperature;
    return FutureBuilder(
        future: weatherRepository.getWeather("Seversk"),
        builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
          Widget children;

          if (snapshot.hasData) {
            children = Center(
              child: Container(
                constraints: BoxConstraints.expand(height: 150.0, width: 350.0),
                decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withOpacity(.25),
                        blurRadius: 13.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    gradient: AppColorScheme.weatherWidgetBackground,
                    borderRadius: new BorderRadius.all(Radius.circular(25))),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 7, // 60%
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 5, // 50%
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 30.0),
                                  child: Text(
                                    '${snapshot.data.cityName}, ${snapshot.data.country}',
                                    style: TextStyle(
                                        color: AppColorScheme.mainFontColor,
                                        fontSize: 22,
                                        fontFamily: 'Roboto-Medium'),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5, // 50%
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0, bottom: 30.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      '${snapshot.data.temperature.celsius.round()}' +
                                          '\u00B0',
                                      style: TextStyle(
                                          color: AppColorScheme.mainFontColor,
                                          fontSize: 40,
                                          fontFamily: 'Roboto-Medium'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, top: 10),
                                      child: Text(
                                        '${snapshot.data.description.toLowerCase()}',
                                        style: TextStyle(
                                            color: AppColorScheme.mainFontColor,
                                            fontSize: 15,
                                            fontFamily: 'Roboto-Regular'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                    Expanded(
                        flex: 3, // 40%
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Icon(
                            snapshot.data.getIconData(),
                            size: 70,
                            color: Color(0xFFFFF4F4),
                          ),
                        )),
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
