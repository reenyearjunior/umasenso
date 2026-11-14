
import 'package:flutter/material.dart';
import 'sign_in_screen.dart';
import 'buyer_register_screen.dart';
import 'register_screen.dart';
import 'cooperative_register_screen.dart';
import 'lgu_register_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentPage = 0;

  final List<Map<String, dynamic>> pages = [
    {
      'icon': Icons.eco,
      'title': 'Walang Sayang',
      'description':
          'Help reduce food waste by connecting farmers and buyers.',
    },
    {
      'icon': Icons.groups,
      'title': 'Komunidad',
      'description':
          'Build connections with farmers, buyers, and local communities.',
    },
    {
      'icon': Icons.storefront,
      'title': 'Direktang Kita',
      'description':
          'Buy and sell fresh agricultural products directly.',
    },
    {
      'icon': Icons.verified_user,
      'title': 'Mabilis at Ligtas',
      'description':
          'Enjoy a simple and convenient agricultural marketplace.',
    },
  ];

  void nextPage() {
    if (currentPage < pages.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const RoleSelectionScreen(),
        ),
      );
    }
  }

  void skipOnboarding() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const RoleSelectionScreen(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8EC),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: skipOnboarding,
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Color(0xFF087443)),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = pages[index];

                  return Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          page['icon'] as IconData,
                          size: 120,
                          color: const Color(0xFF087443),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          page['title'] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF087443),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          page['description'] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                (index) => Container(
                  margin: const EdgeInsets.all(4),
                  width: currentPage == index ? 22 : 9,
                  height: 9,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? const Color(0xFF087443)
                        : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF087443),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    currentPage == pages.length - 1
                        ? 'Get Started'
                        : 'Next',
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

// ROLE SELECTION SCREEN

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final roles = [
      {
        'name': 'Magsasaka',
        'description':
            'Magbenta ng iyong ani at pamahalaan ang iyong sakahan.',
        'icon': Icons.agriculture,
        'color': Colors.green,
      },
      {
        'name': 'Mamimili',
        'description':
            'Mag-order ng sariwang produkto direkta sa mga magsasaka.',
        'icon': Icons.storefront,
        'color': Colors.blue,
      },
      {
        'name': 'Kooperatiba',
        'description':
            'Pamunuan ang mga miyembro at mga produkto.',
        'icon': Icons.groups,
        'color': Colors.orange,
      },
      {
        'name': 'LGU',
        'description':
            'Subaybayan ang datos at suportahan ang komunidad.',
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
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 35),

            ...roles.map((role) {
              final roleName = role['name'] as String;
              final roleColor = role['color'] as Color;

              return Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: () {
  Widget destination;

  switch (roleName) {
    case 'Magsasaka':
      destination = const RegisterScreen();
      break;

    case 'Mamimili':
      destination = const BuyerRegisterScreen();
      break;

    case 'Kooperatiba':
      destination = const CooperativeRegisterScreen();
      break;

    case 'LGU':
      destination = const LguRegisterScreen();
      break;

    default:
      return;
  }

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => destination,
    ),
  );
},
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: roleColor,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 38,
                          backgroundColor: roleColor,
                          child: Icon(
                            role['icon'] as IconData,
                            color: Colors.white,
                            size: 38,
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                roleName,
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
                        const Icon(
                          Icons.chevron_right,
                          size: 30,
                        ),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SignInScreen(),
                    ),
                  );
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

// ROLE-SPECIFIC SIGN-IN SCREEN

class RoleSignInScreen extends StatelessWidget {
  final String role;
  final Color roleColor;

  const RoleSignInScreen({
    super.key,
    required this.role,
    required this.roleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8EC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F8EC),
        title: Text(role),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            Text(
              'Welcome, $role!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: roleColor,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Mag-login sa iyong UmaSenso account.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: 18),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Login authentication is not connected yet.',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: roleColor,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Login'),
              ),
            ),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SignInScreen(),
                    ),
                  );
                },
                child: const Text('Back to Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
