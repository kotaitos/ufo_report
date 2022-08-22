import 'package:cloud_firestore/cloud_firestore.dart';

class Report {
  String content;
  DateTime createdAt;
  Report(this.content, this.createdAt);

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'created_at': Timestamp.fromDate(createdAt),
    };
  }
}
