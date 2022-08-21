class Report {
  String content;
  DateTime createdAt;
  Report(this.content, this.createdAt);

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'created_at': createdAt,
    };
  }
}
