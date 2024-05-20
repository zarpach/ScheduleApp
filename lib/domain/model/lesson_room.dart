// LessonRoom class
class LessonRoom {
  final String id;
  final String roomName;
  final int roomCapacity;
  final int floor;

  LessonRoom({
    required this.id,
    required this.roomName,
    required this.roomCapacity,
    required this.floor,
  });

  factory LessonRoom.fromJson(Map<String, dynamic> json) {
    return LessonRoom(
      id: json['id'],
      roomName: json['roomName'],
      roomCapacity: json['roomCapacity'],
      floor: json['floor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roomName': roomName,
      'roomCapacity': roomCapacity,
      'floor': floor,
    };
  }
}