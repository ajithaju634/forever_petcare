
class Appointmentmodel {
  final String id;
  final String email;
  final String date;
  final String time;
  final String details;

  Appointmentmodel({
    required this.id,
    required this.email,
    required this.date,
    required this.time,
    required this.details,
  });

  factory Appointmentmodel.fromFirestore(Map<String, dynamic> data, String id) {
    return Appointmentmodel(
      id: id,
      email: data['email'] ?? '',
      date: data['date'] ?? '',
      time: data['time'] ?? '',
      details: data['details'] ?? '',
    );
  }
}