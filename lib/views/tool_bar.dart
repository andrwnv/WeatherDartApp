import 'package:flutter/material.dart';

import 'package:weather_app/color_scheme.dart';
import 'package:weather_app/network/weather_api_client.dart';

class ToolBarWidget extends StatefulWidget {
  ToolBarWidget({Key key}) : super(key: key);

  @override
  _ToolBarWidget createState() => _ToolBarWidget();
}

class _ToolBarWidget extends State<ToolBarWidget> {
  _ToolBarWidget() {
    // _api.getForecasts(56.593795, 84.895908).then((value) => {
    //   _currentTemp = value[0].dayParts[0].tempAvg
    // });
  }

  // YandexWeatherApi _api = new YandexWeatherApi();

  int _currentTemp = 24;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(children: <Widget>[
      Expanded(
        flex: 8,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Container(
            constraints: BoxConstraints.expand(height: 45.0, width: 250.0),
            decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.white.withOpacity(.2),
                    blurRadius: 13.0,
                    spreadRadius: 2.0,
                  ),
                ],
                color: AppColorScheme.mainColor,
                borderRadius: new BorderRadius.all(Radius.circular(13))),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: TextField(
                        style: TextStyle(
                            color: AppColorScheme.alternativeMainColor,
                            fontSize: 14,
                            fontFamily: 'Roboto-Regular'),
                        enableInteractiveSelection: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'City Name ...',
                          hintStyle: TextStyle(
                              color: AppColorScheme.alternativeMainColor,
                              fontSize: 14,
                              fontFamily: 'Roboto-Regular'),
                        ),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Icon(Icons.search, color: Color(0xFF6237FF)),
                    )),
              ],
            ),
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 15.0),
          child: Container(
            constraints: BoxConstraints.expand(height: 45.0, width: 45.0),
            decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.white.withOpacity(.2),
                    blurRadius: 13.0,
                    spreadRadius: 2.0,
                  ),
                ],
                color: AppColorScheme.mainColor,
                borderRadius: new BorderRadius.all(Radius.circular(13))),
            // child: Image.asset('assets/icons/settings.png', width: 13, height: 13),
            child: Icon(Icons.gps_fixed, color: Color(0xFF6237FF)),
          ),
        ),
      )
    ]));
  }
}
