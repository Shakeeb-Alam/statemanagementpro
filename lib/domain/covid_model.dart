class CovidReport {
  int? confirmed;
  int? confirmedDiff;
  int? deaths;
  int? deathsDiff;
  int? recovered;
  int? recoveredDiff;
  int? active;
  int? activeDiff;
  String? date;
  String? lastUpdate;
  double? fatalityRate;

  CovidReport({
    this.confirmed,
    this.confirmedDiff,
    this.deaths,
    this.deathsDiff,
    this.recoveredDiff,
    this.recovered,
    this.active,
    this.activeDiff,
    this.date,
    this.lastUpdate,
    this.fatalityRate,
  });

  factory CovidReport.fromJson(Map<String, dynamic> json) {
    return CovidReport(
      confirmed: json['confirmed'] ?? 0,
      confirmedDiff: json['confirmed_diff'] ?? 0,
      deaths: json['deaths'] ?? 0,
      deathsDiff: json['deaths_diff'] ?? 0,
      recovered: json['recovered'] ?? 0,
      recoveredDiff: json['recovered_diff'] ?? 0,
      active: json['active'] ?? 0,
      activeDiff: json['active_diff'] ?? 0,
      date: json['date'] ?? '',
      lastUpdate: json['last_update'] ?? '',
      fatalityRate: json['fatality_rate'] ?? 0,
    );
  }
}
