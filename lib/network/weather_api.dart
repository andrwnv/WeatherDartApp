import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

void _checkStatusCode(int statusCode) {
  print(statusCode);
  if (statusCode > 400 || statusCode < 200 || json == null) {
    throw new Exception("[API]: Error to fetch data!");
  }
}

Future<dynamic> get(String url, Map<String, String> headers) async {
  final response = await http.get(url, headers: headers);
  _checkStatusCode(response.statusCode);

  print(response);

  return json.decode(response.body);
}

class DayPart {
  final int tempAvg;
  final int fillLike;
  final double windSpeed;
  final String windDir;
  final String condition;
  final int pressureMm;
  final int humidity;

  DayPart(this.tempAvg, this.fillLike, this.windSpeed, this.windDir,
      this.condition, this.pressureMm, this.humidity);
}

class DayData {
  final int dateTs;
  final String sunrise;
  final String sunset;

  final List<DayPart> dayParts;

  DayData(this.dateTs, this.sunrise, this.sunset, this.dayParts);

  factory DayData.fromJson(Map<String, dynamic> response) {
    List<DayPart> parts;

    return DayData(1, '', '', List<DayPart>());
  }

  @override
  String toString() {
    return '$dateTs \n';
  }
}

void main() async {
  final _baseHeaders = {
    'X-Yandex-API-Key': 'cc38ee37-4252-45db-9bc2-b9f14425ca51'
  };


  var baseUrl =
      'https://api.weather.yandex.ru/v2/forecast?lat=56.593795&lon=84.895908';

  final Object responseJSON = await get(baseUrl, _baseHeaders);

  print(responseJSON);

//  var dates = Map<String, dynamic>.from(responseJSON)['forecasts'] as Iterable;
//
//  for (var item in dates) {
//    print(item['date']);
//    print(item['parts']['day']['temp_avg']);
//  }
}
