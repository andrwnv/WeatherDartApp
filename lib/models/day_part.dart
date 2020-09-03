class DayPart {
  final String partName;

  final int    tempAvg;
  final int    fillLike;
  final num    windSpeed;
  final String windDir;
  final String condition;
  final int    pressureMm;
  final int    humidity;

  DayPart(this.partName, this.tempAvg, this.fillLike, this.windSpeed, this.windDir,
          this.condition, this.pressureMm, this.humidity);

  @override
  String toString() {
    return '{ tempAvg: $tempAvg, fillLike: $fillLike, windSpeed: $windSpeed, \ '
        'windDir: $windDir, condition: $condition, \ '
        'pressureMm: $pressureMm, humidity: $humidity } \n';
  }
}
