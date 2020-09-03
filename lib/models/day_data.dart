import 'day_part.dart';

class DayData {
  final int    dateTs;
  final String sunrise;
  final String sunset;

  final List<DayPart> dayParts;

  DayData(this.dateTs, this.sunrise, this.sunset, this.dayParts);

  @override
  String toString() {
    var res = '{ dateTs: $dateTs, sunrise: $sunrise, sunset: $sunset } \n dayParts: [ \n';

    for (var part in dayParts) {
      res += part.toString();
    }
    res += '] \n';

    return res;
  }
}
