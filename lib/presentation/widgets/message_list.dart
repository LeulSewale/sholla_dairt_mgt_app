import 'package:dairy_management/presentation/bloc/communication/communication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/message.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunicationBloc, CommunicationState>(
      builder: (context, state) {
        if (state is CommunicationLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CommunicationError) {
          return Center(child: Text('Error: ${state.message}'));
        }

        if (state is CommunicationLoaded) {
          return ListView.builder(
            itemCount: state.messages.length,
            itemBuilder: (context, index) {
              final message = state.messages[index];
              return MessageCard(message: message);
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}

class MessageCard extends StatefulWidget {
  final Message message;

  const MessageCard({super.key, required this.message});

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: const EdgeInsets.only(left: 4),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.message, color: Colors.blue),
          ),
          title: Text(
            widget.message.title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.message.date.day}/${widget.message.date.month}/${widget.message.date.year}',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildStatusChip(widget.message.status),
              // const SizedBox(width: 8),
              TextButton(
                onPressed: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                child: Text(expanded ? 'Hide Details' : 'View Details'),
              ),
            ],
          ),
        ),
        if (expanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Text(
              widget.message.description ?? 'No description available.',
              style: const TextStyle(fontSize: 13, color: Colors.black87),
            ),
          ),
        if (expanded) const Divider(height: 1),
      ],
    );
  }

  Widget _buildStatusChip(MessageStatus status) {
    Color color;
    String text;

    switch (status) {
      case MessageStatus.pending:
        color = Colors.orange;
        text = 'Pending';
        break;
      case MessageStatus.answered:
        color = Colors.green;
        text = 'Answered';
        break;
      case MessageStatus.resolved:
        color = Colors.blue;
        text = 'Resolved';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
