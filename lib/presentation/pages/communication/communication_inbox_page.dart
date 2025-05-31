import 'package:flutter/material.dart';

class CommunicationsInboxPage extends StatelessWidget {
  const CommunicationsInboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Communications',
      )),
      backgroundColor: const Color(0xFFF6F6F9),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text("Inbox",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFECECF6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.blue),
                        SizedBox(width: 8),
                        Expanded(
                            child: Text("Search for Inbox",
                                style: TextStyle(color: Colors.grey))),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.filter_alt_outlined,
                      color: Colors.white),
                )
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Card(
                child: ListView(
                  children: const [
                    MessageCard(
                      title: "Response | Lagging Distribution",
                      team: "Sholla Sales Team",
                    ),
                    MessageCard(
                      title: "Response | Spilling Milk",
                      team: "Sholla Sales Team",
                    ),
                    MessageCard(
                      title: "Response | Spilling Milk",
                      team: "Sholla Procurement Team",
                    ),
                    MessageCard(
                      title: "Response | Bad Customer Service",
                      team: "Sholla Sales Team",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageCard extends StatefulWidget {
  final String title;
  final String team;

  const MessageCard({
    super.key,
    required this.title,
    required this.team,
  });

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFFECECF6),
                child: Icon(Icons.chat_sharp, color: Colors.blue),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(widget.team,
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                child: Text(expanded ? "Hide Message" : "View Message"),
              )
            ],
          ),
          if (expanded)
            const Padding(
              padding: EdgeInsets.only(left: 52, top: 8, right: 8),
              child: Text(
                "This is the detailed description of the message. You can replace this text with the actual message content.",
                style: TextStyle(fontSize: 13, color: Colors.black87),
              ),
            ),
        ],
      ),
    );
  }
}
