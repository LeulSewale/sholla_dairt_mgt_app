import 'package:dairy_management/presentation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<Map<String, String>> notifications = [
    {
      'title': 'Your credit request has been accepted',
      'date': 'Jan 28 / 2025',
      'details':
          'Congratulations! Your credit request has been approved. You can now use your credit for purchases.',
    },
    {
      'title': 'Document Payment',
      'date': 'Jan 25 / 2025',
      'details':
          'Your document payment has been received and processed successfully.',
    },
    {
      'title': 'CPO Payment',
      'date': 'Jan 22 / 2025',
      'details':
          'CPO payment has been completed. Please check your account for confirmation.',
    },
    {
      'title': 'Document Payment',
      'date': 'Jan 21 / 2025',
      'details':
          'Another document payment was processed. Thank you for your prompt action.',
    },
  ];

  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for Notifications',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: const Color(0xFFF0F2F8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF065699),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.filter_alt_outlined,
                      color: Colors.white),
                )
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Card(
                elevation: 0,
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final item = notifications[index];
                    final isExpanded = expandedIndex == index;
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Color(0xFFF0F2F8),
                                child: Icon(Icons.notifications_none_outlined,
                                    color: Color(0xFF065699)),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['title']!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        overflow:isExpanded? TextOverflow.visible: TextOverflow.ellipsis
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item['date']!,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    if (isExpanded) ...[
                                      const SizedBox(height: 8),
                                      Text(
                                        item['details'] ?? '',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ]
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    expandedIndex = isExpanded ? null : index;
                                  });
                                },
                                child: Text(
                                  isExpanded ? 'Hide' : 'View',
                                  style:
                                      const TextStyle(color: Color(0xFF065699)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
