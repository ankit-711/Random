import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> users = [
      {
        'name': 'Joe Belfiore',
        'chat': 'In a world far away',
        'image': 'assets/images/user1.png',
        'status': Colors.green,
      },
      {
        'name': 'Bill Gates',
        'chat': "What I'm doing here?",
        'image': 'assets/images/user2.png',
        'status': Colors.green,
      },
      {
        'name': 'Mark Zuckerberg',
        'chat': 'Really Busy, WhatsApp only',
        'image': 'assets/images/user3.png',
        'status': Colors.orange,
      },
      {
        'name': 'Marissa Mayer',
        'chat': 'In a rush to catch a plane',
        'image': 'assets/images/user4.png',
        'status': Colors.red,
      },
      {
        'name': 'Sundar Pichai',
        'chat': 'Do androids dream of electric sheep?',
        'image': 'assets/images/user5.png',
        'status': Colors.green,
      },
      {
        'name': 'Jeff Bezos',
        'chat': 'Counting Zeroes : Prime time.',
        'image': 'assets/images/user6.png',
        'status': Colors.orange,
      },
      {
        'name': 'Joe Belfiore',
        'chat': 'In a world far away',
        'image': 'assets/images/user1.png',
        'status': Colors.green,
      },
      {
        'name': 'Bill Gates',
        'chat': "What I'm doing here?",
        'image': 'assets/images/user2.png',
        'status': Colors.green,
      },
      {
        'name': 'Mark Zuckerberg',
        'chat': 'Really Busy, WhatsApp only',
        'image': 'assets/images/user3.png',
        'status': Colors.orange,
      },
      {
        'name': 'Marissa Mayer',
        'chat': 'In a rush to catch a plane',
        'image': 'assets/images/user4.png',
        'status': Colors.red,
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
        backgroundColor: Colors.green,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(user['image'].toString()),
                ),
                Positioned(
                  bottom: 3,
                  right: 3,
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: user['status'],
                    ),
                  )
                ),
              ],
            ),
            title: Text(
              user['name'].toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              user['chat'].toString(),
              style: const TextStyle(fontSize: 12, color: Colors.grey,fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}
