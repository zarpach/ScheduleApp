import 'dart:convert';
import 'announcement_section.dart';
import 'lesson_period.dart';
import 'lesson_room.dart';
import 'semester.dart';
import 'department.dart';
import 'group.dart';

// Slot class
class Slot {
  final String id;
  final Department department;
  final Group group;
  final int semesterId;
  final Semester semester;
  final String instructorUserId;
  final int dayOfWeek;
  final String lessonRoomId;
  final LessonRoom lessonRoom;
  final LessonPeriod lessonPeriod;
  final int announcementSectionId;
  final AnnouncementSection announcementSection;

  Slot({
    required this.id,
    required this.department,
    required this.group,
    required this.semesterId,
    required this.semester,
    required this.instructorUserId,
    required this.dayOfWeek,
    required this.lessonRoomId,
    required this.lessonRoom,
    required this.lessonPeriod,
    required this.announcementSectionId,
    required this.announcementSection,
  });

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      id: json['id'],
      department: Department.fromJson(json['department']),
      group: Group.fromJson(json['group']),
      semesterId: json['semesterId'],
      semester: Semester.fromJson(json['semester']),
      instructorUserId: json['instructorUserId'],
      dayOfWeek: json['dayOfWeek'],
      lessonRoomId: json['lessonRoomId'],
      lessonRoom: LessonRoom.fromJson(json['lessonRoom']),
      lessonPeriod: LessonPeriod.fromJson(json['lessonPeriod']),
      announcementSectionId: json['announcementSectionId'],
      announcementSection: AnnouncementSection.fromJson(json['announcementSection']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'department': department.toJson(),
      'group': group.toJson(),
      'semesterId': semesterId,
      'semester': semester.toJson(),
      'instructorUserId': instructorUserId,
      'dayOfWeek': dayOfWeek,
      'lessonRoomId': lessonRoomId,
      'lessonRoom': lessonRoom.toJson(),
      'lessonPeriod': lessonPeriod.toJson(),
      'announcementSectionId': announcementSectionId,
      'announcementSection': announcementSection.toJson(),
    };
  }
}