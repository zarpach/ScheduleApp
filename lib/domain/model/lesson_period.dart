// LessonPeriod class
class LessonPeriod {
  final int id;
  final String name;
  final String timeBegin;
  final String timeEnd;

  LessonPeriod({
    required this.id,
    required this.name,
    required this.timeBegin,
    required this.timeEnd,
  });

  factory LessonPeriod.fromJson(Map<String, dynamic> json) {
    return LessonPeriod(
      id: json['id'],
      name: json['name'],
      timeBegin: json['timeBegin'],
      timeEnd: json['timeEnd'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'timeBegin': timeBegin,
      'timeEnd': timeEnd,
    };
  }
}