import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String id;
  String contactId;
  String content;
  bool isFile;
  Timestamp timestamp;

  MessageModel({
    required this.id,
    required this.contactId,
    required this.content,
    required this.isFile,
    required this.timestamp,
  });

  factory MessageModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MessageModel(
      id: doc.id,
      contactId: data['contactId'],
      content: data['content'],
      isFile: data['isFile'],
      timestamp: data['timestamp'],
    );
  }
}
