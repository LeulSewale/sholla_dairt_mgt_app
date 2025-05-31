import '../../domain/entities/message.dart';

class MessageModel extends Message {
  const MessageModel({
    required super.id,
    required super.title,
    required super.content,
    required super.sender,
    required super.date,
    required super.status,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      sender: json['sender'],
      date: DateTime.parse(json['date']),
      status: MessageStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'sender': sender,
      'date': date.toIso8601String(),
      'status': status.toString().split('.').last,
    };
  }
}
