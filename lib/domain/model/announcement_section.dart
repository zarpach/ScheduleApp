// AnnouncementSection class
import 'announcement.dart';

class AnnouncementSection {
  final int id;
  final Announcement announcement;
  final int announcementId;
  final String instructorUserId;
  final int credits;
  final String section;

  AnnouncementSection({
    required this.id,
    required this.announcement,
    required this.announcementId,
    required this.instructorUserId,
    required this.credits,
    required this.section,
  });

  factory AnnouncementSection.fromJson(Map<String, dynamic> json) {
    return AnnouncementSection(
      id: json['id'],
      announcement: Announcement.fromJson(json['announcement']),
      announcementId: json['announcementId'],
      instructorUserId: json['instructorUserId'],
      credits: json['credits'],
      section: json['section'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'announcement': announcement.toJson(),
      'announcementId': announcementId,
      'instructorUserId': instructorUserId,
      'credits': credits,
      'section': section,
    };
  }
}