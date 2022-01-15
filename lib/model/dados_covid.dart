class CovidModel {
  final String? city;
  final String? cityIbgeCode;
  final String? confirmed;
  final String? confirmedPer100kInhabitants;
  final String? date;
  final String? deathRate;
  final String? deaths;
  final String? estimatedPopulation;
  final String? estimatedPopulation2019;
  final String? isLast;
  final String? placeType;
  final String? state;

  CovidModel(
      {this.city,
      this.cityIbgeCode,
      this.confirmed,
      this.confirmedPer100kInhabitants,
      this.date,
      this.deathRate,
      this.deaths,
      this.estimatedPopulation,
      this.estimatedPopulation2019,
      this.isLast,
      this.placeType,
      this.state});

  factory CovidModel.fromJson(Map json) {
    return CovidModel(
      city: json['city'].toString(),
      cityIbgeCode: json['city_ibge_code'].toString(),
      confirmed: json['confirmed'].toString(),
      confirmedPer100kInhabitants:
          json['confirmed_per_100k_inhabitants'].toString(),
      date: json['date'].toString(),
      deathRate: json['death_rate'].toString(),
      deaths: json['deaths'].toString(),
      estimatedPopulation: json['estimated_population'].toString(),
      estimatedPopulation2019: json['estimated_population_2019'].toString(),
      isLast: json['is_last'].toString(),
      placeType: json['place_type'].toString(),
      state: json['state'].toString(),
    );
  }
}
