
import 'package:flutter/material.dart';
import 'register_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final roles = [
      {
        'name': 'Magsasaka',
        'description': 'Magbenta ng iyong ani at pamahalaan ang iyong sakahan.',
        'icon': Icons.agriculture,
        'color': Colors.green,
      },
      {
        'name': 'Mamimili',
        'description': 'Mag-order ng sariwang produkto direkta sa mga magsasaka.',
        'icon': Icons.storefront,
        'color': Colors.blue,
      },
      {
        'name': 'Kooperatiba',
        'description': 'Pamunuan ang mga miyembro at mga produkto.',
        'icon': Icons.groups,
        'color': Colors.orange,
      },
      {
        'name': 'LGU',
        'description': 'Subaybayan ang datos at suportahan ang komunidad.',
        'icon': Icons.account_balance,
        'color': Colors.deepPurple,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9EC),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: 35),
            const Text(
              'Sino Ka?',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFF075C3B),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Piliin ang iyong role upang makapagpatuloy.',
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            const SizedBox(height: 35),

            ...roles.map((role) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: role['color'] as Color,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 38,
                          backgroundColor: role['color'] as Color,
                          child: Icon(
                            role['icon'] as IconData,
                            color: Colors.white,
                            size: 38,
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                role['name'] as String,
                                style: const TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                role['description'] as String,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right, size: 30),
                      ],
                    ),
                  ),
                ),
              );
            }),

            const SizedBox(height: 25),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'May Account Na? Mag-login',
                  style: TextStyle(
                    color: Color(0xFF087443),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
