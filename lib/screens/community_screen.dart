import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8EC),
      appBar: AppBar(
        title: const Text('Komunidad'),
        backgroundColor: const Color(0xFF087443),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Mga Miyembro ng Komunidad',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),

          _member('👨‍🌾', 'Juan Dela Cruz', 'Magsasaka'),
          _member('👩', 'Maria Santos', 'Mamimili'),
          _member('🌱', 'San Isidro Cooperative', 'Kooperatiba'),
          _member('🏛️', 'LGU San Pedro', 'LGU'),
          _member('👨‍🌾', 'Pedro Garcia', 'Magsasaka'),
        ],
      ),
    );
  }

  Widget _member(String avatar, String name, String role) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(avatar, style: const TextStyle(fontSize: 23)),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(role),
        trailing: const Icon(Icons.chat_bubble_outline),
        onTap: () {},
      ),
    );
  }
}