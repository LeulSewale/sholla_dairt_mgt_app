import 'package:dairy_management/core/constants/app_constants.dart';
import 'package:dairy_management/domain/entities/message.dart';
import 'package:dairy_management/presentation/pages/notification/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/communication/communication_bloc.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  void initState() {
    super.initState();
    context.read<CommunicationBloc>().add(LoadMessages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        actions: [
          CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                    
                  
            child: IconButton(
              icon: const Icon(Icons.notifications, color: AppColors.primery),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                );
              },
            ),
              )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Search for Inbox',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primery,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.filter_alt_outlined,
                        color: Colors.white),
                    onPressed: () {
                      // Show filter options
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Expanded(child: Card(child: OrderList())),
          ],
        ),
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  const OrderList({super.key});

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
              return OrderListCard(message: message);
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}

class OrderListCard extends StatefulWidget {
  final Message message;

  const OrderListCard({super.key, required this.message});

  @override
  State<OrderListCard> createState() => _OrderListCardState();
}

class _OrderListCardState extends State<OrderListCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.bgprimery,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.card_travel, color: AppColors.primery),
          ),
          title: Text(
            widget.message.title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
          ),
          subtitle: Text(
            '${widget.message.date.day}/${widget.message.date.month}/${widget.message.date.year}',
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
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
                child: Text(expanded ? 'Hide' : 'View' ,style: const TextStyle(
                  decoration: TextDecoration.underline
                )),
              ),
            ],
          ),
        ),
        if (expanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
