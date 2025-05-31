import 'package:dairy_management/core/constants/app_constants.dart';
import 'package:dairy_management/presentation/pages/notification/notification.dart';
import 'package:flutter/material.dart';

class SendMessagePage extends StatefulWidget {
  const SendMessagePage({super.key});

  @override
  State<SendMessagePage> createState() => _SendMessagePageState();
}

class _SendMessagePageState extends State<SendMessagePage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedSubject;
  final TextEditingController _messageController = TextEditingController();

  final List<String> _subjects = [
    'General Inquiry',
    'Technical Support',
    'Billing',
    'Feedback',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Communications', style: TextStyle(color: Colors.black)),
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
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Send Message',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Subject',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: _selectedSubject,
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF07529E),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.checklist,
                                color: Colors.white),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF9F9FC),
                          hintText: 'Enter Subject',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        items: _subjects
                            .map((subject) => DropdownMenuItem(
                                  value: subject,
                                  child: Text(subject),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedSubject = value;
                          });
                        },
                        validator: (value) =>
                            value == null ? 'Please select a subject' : null,
                      ),
                      const SizedBox(height: 20),
                      const Text('Enter Message',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _messageController,
                        maxLines: 6,
                        decoration: InputDecoration(
                          hintText: 'Enter Message',
                          filled: true,
                          fillColor: const Color(0xFFF9F9FC),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Please enter a message'
                            : null,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF07529E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Handle send logic here
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Message Sent!')),
                              );
                            }
                          },
                          child: const Text('Send Message',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
