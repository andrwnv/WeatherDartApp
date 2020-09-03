import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:weather_app/models/day_data.dart';
import 'package:weather_app/models/day_part.dart';
import 'package:weather_app/network/api_keys.dart';


class YandexWeatherApi {
  String _baseUrl = 'https://api.weather.yandex.ru/v2/';

  List<String> timeOfDay = [ 'night', 'morning', 'day', 'evening', 'day_short', 'night_short' ];

  void _checkStatusCode(int statusCode) {
    if (statusCode > 400 || statusCode < 200 || json == null)
      throw new HttpException("[Yandex Weather API]: Error to fetch data!");
  }

  Future<dynamic> _get(String url, Map<String, String> headers) async {
    final response = await http.get(url, headers: headers);
    _checkStatusCode(response.statusCode);

    return json.decode(response.body);
  }

  List<DayData> parseResponse(Map<String, dynamic> response) {
    var dayForecasts = Map.from(response)['forecasts'] as Iterable;

    List<DayData> forecasts = [];

    for (var forecast in dayForecasts) {
      List<DayPart> dayParts = [];

      for (var part in timeOfDay) {
        var _part = forecast['parts'][part];
        dayParts.add(DayPart(
            part,
            _part['temp_avg'],
            _part['feels_like'],
            _part['wind_speed'],
            _part['wind_dir'],
            _part['condition'],
            _part['pressure_mm'],
            _part['humidity']));
      }

      forecasts.add(DayData(forecast['date_ts'], forecast['sunrise'], forecast['sunset'], dayParts));
    }

    return forecasts;
  }

  Future<List<DayData>> getForecasts(double latitude, double longitude) async {
    var response = await _get(_baseUrl + 'forecast?lat=$latitude&lon=$longitude&limit=7',
        ApiKeys.yandexHeader);

    print(response);

    return parseResponse(response as Map<String, dynamic>);
  }
}

void main() async {
  YandexWeatherApi api = new YandexWeatherApi();

  for (var item in await api.getForecasts(56.593795, 84.895908)) {
    print(item);
  }
}
