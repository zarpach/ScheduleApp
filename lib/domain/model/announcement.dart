// Announcement class
import 'course.dart';

class Announcement {
  final int id;
  final Course course;
  final int courseId;
  final bool isActivated;

  Announcement({
    required this.id,
    required this.course,
    required this.courseId,
    required this.isActivated,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      id: json['id'],
      course: Course.fromJson(json['course']),
      courseId: json['courseId'],
      isActivated: json['isActivated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course': course.toJson(),
      'courseId': courseId,
      'isActivated': isActivated,
    };
  }
}