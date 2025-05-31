import 'package:equatable/equatable.dart';

enum MessageStatus { pending, answered, resolved }

class Message extends Equatable {
  final String id;
  final String title;
  final String content;
  final String sender;
  final DateTime date;
  final MessageStatus status;

  const Message({
    required this.id,
    required this.title,
    required this.content,
    required this.sender,
    required this.date,
    required this.status,
  });

  @override
  List<Object> get props => [id, title, content, sender, date, status];

  get description => null;
}
