// Semester class
class Semester {
  final int id;
  final int season;
  final int year;
  final int organizationId;
  final String seasonYear;

  Semester({
    required this.id,
    required this.season,
    required this.year,
    required this.organizationId,
    required this.seasonYear,
  });

  factory Semester.fromJson(Map<String, dynamic> json) {
    return Semester(
      id: json['id'],
      season: json['season'],
      year: json['year'],
      organizationId: json['organizationId'],
      seasonYear: json['seasonYear'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'season': season,
      'year': year,
      'organizationId': organizationId,
      'seasonYear': seasonYear,
    };
  }
}