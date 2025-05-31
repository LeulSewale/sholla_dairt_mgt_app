import 'package:dairy_management/core/constants/app_constants.dart';
import 'package:dairy_management/presentation/pages/communication/communication_inbox_page.dart';
import 'package:dairy_management/presentation/pages/communication/communication_message.dart';
import 'package:dairy_management/presentation/pages/notification/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/communication/communication_bloc.dart';
import '../../widgets/message_list.dart';

class CommunicationPage extends StatefulWidget {
  const CommunicationPage({super.key});

  @override
  State<CommunicationPage> createState() => _CommunicationPageState();
}

class _CommunicationPageState extends State<CommunicationPage> {
  @override
  void initState() {
    super.initState();
    context.read<CommunicationBloc>().add(LoadMessages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Communication'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: AppColors.primery),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Action Buttons
            const Text(
              'Action',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to send message page  CommunicationsInboxPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SendMessagePage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.message),
                    label: const Text('Send Message'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CommunicationsInboxPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.inbox),
                    label: const Text('Inbox'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // My Inboxes Section
            const Text(
              'My Inboxes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Search and Filter Row
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
            const Expanded(child: Card(child: MessageList())),
          ],
        ),
      ),
    );
  }
}
