import 'package:cloud_firestore/cloud_firestore.dart';

class Messsage {
  final String senderId;
  final String sendingEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  Messsage({
    required this.receiverId,
    required this.message,
    required this.timestamp,
    required this.senderId,
    required this.sendingEmail,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'sendingEmail': sendingEmail,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
