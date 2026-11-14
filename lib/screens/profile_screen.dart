
import 'package:flutter/material.dart';
import '../app_shared.dart';
import 'sign_in_screen.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String role;

  const ProfileScreen({
    super.key,
    this.role = 'Magsasaka',
  });

  @override
  Widget build(BuildContext context) {
    final isFarmer = role == 'Magsasaka';
    final isBuyer = role == 'Mamimili';
    final isCooperative = role == 'Kooperatiba';
    final isLgu = role == 'LGU';

    String displayName = store.customerName.isNotEmpty
        ? store.customerName
        : isFarmer
            ? 'Juan Dela Cruz'
            : isBuyer
                ? 'Juan Buyer'
                : isCooperative
                    ? 'San Isidro Cooperative'
                    : 'LGU Administrator';

    IconData profileIcon = isFarmer
        ? Icons.agriculture
        : isBuyer
            ? Icons.shopping_bag
            : isCooperative
                ? Icons.groups
                : Icons.account_balance;

    String subtitle = isFarmer
        ? 'Farmer Account'
        : isBuyer
            ? 'Buyer Account'
            : isCooperative
                ? 'Cooperative Account'
                : 'Local Government Unit';

    List<Map<String, dynamic>> menuItems = [];

    if (isFarmer) {
      menuItems = [
        {'icon': Icons.person_outline, 'title': 'Personal Information'},
        {'icon': Icons.agriculture_outlined, 'title': 'Farm Information'},
        {'icon': Icons.inventory_2_outlined, 'title': 'My Products'},
        {'icon': Icons.account_balance_wallet_outlined, 'title': 'Payment Methods'},
        {'icon': Icons.notifications_none_outlined, 'title': 'Notification Preferences'},
        {'icon': Icons.language_outlined, 'title': 'Language'},
        {'icon': Icons.lock_outline, 'title': 'Change Password'},
        {'icon': Icons.security_outlined, 'title': 'Privacy Settings'},
        {'icon': Icons.help_outline, 'title': 'Help Center'},
        {'icon': Icons.support_agent_outlined, 'title': 'Contact Support'},
        {'icon': Icons.info_outline, 'title': 'About UMAsenso'},
      ];
    } else if (isBuyer) {
      menuItems = [
        {'icon': Icons.person_outline, 'title': 'Personal Information'},
        {'icon': Icons.location_on_outlined, 'title': 'Delivery Address'},
        {'icon': Icons.shopping_bag_outlined, 'title': 'My Orders'},
        {'icon': Icons.favorite_border, 'title': 'Saved Products'},
        {'icon': Icons.account_balance_wallet_outlined, 'title': 'Payment Methods'},
        {'icon': Icons.notifications_none_outlined, 'title': 'Notifications'},
        {'icon': Icons.lock_outline, 'title': 'Change Password'},
        {'icon': Icons.security_outlined, 'title': 'Privacy Settings'},
        {'icon': Icons.help_outline, 'title': 'Help Center'},
        {'icon': Icons.support_agent_outlined, 'title': 'Contact Support'},
        {'icon': Icons.info_outline, 'title': 'About UMAsenso'},
      ];
    } else if (isCooperative) {
      menuItems = [
        {'icon': Icons.groups_outlined, 'title': 'Cooperative Information'},
        {'icon': Icons.badge_outlined, 'title': 'Registration Details'},
        {'icon': Icons.people_outline, 'title': 'Manage Members'},
        {'icon': Icons.inventory_2_outlined, 'title': 'Product Monitoring'},
        {'icon': Icons.assessment_outlined, 'title': 'Cooperative Reports'},
        {'icon': Icons.account_balance_wallet_outlined, 'title': 'Payment Information'},
        {'icon': Icons.notifications_none_outlined, 'title': 'Notifications'},
        {'icon': Icons.lock_outline, 'title': 'Change Password'},
        {'icon': Icons.help_outline, 'title': 'Help Center'},
        {'icon': Icons.info_outline, 'title': 'About UMAsenso'},
      ];
    } else {
      menuItems = [
        {'icon': Icons.account_balance_outlined, 'title': 'LGU Information'},
        {'icon': Icons.business_outlined, 'title': 'Department Information'},
        {'icon': Icons.person_outline, 'title': 'Authorized Representative'},
        {'icon': Icons.agriculture_outlined, 'title': 'Farmer Monitoring'},
        {'icon': Icons.groups_outlined, 'title': 'Community Monitoring'},
        {'icon': Icons.assessment_outlined, 'title': 'Agricultural Reports'},
        {'icon': Icons.notifications_none_outlined, 'title': 'Notifications'},
        {'icon': Icons.lock_outline, 'title': 'Change Password'},
        {'icon': Icons.help_outline, 'title': 'Help Center'},
        {'icon': Icons.info_outline, 'title': 'About UMAsenso'},
      ];
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: ink),
          onPressed: () {},
        ),
        actions: [
          IconButton(
  icon: const Icon(
    Icons.settings,
    color: forest,
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  },
),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          children: [
            // PROFILE HEADER
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: forest,
                    child: Icon(
                      profileIcon,
                      size: 48,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    displayName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: ink,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: forest,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      role,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // FARMER PROFILE
            if (isFarmer) ...[
              _infoCard(
                icon: Icons.grass,
                title: 'Dela Cruz Family Farm',
                subtitle: 'San Isidro, Laguna',
                details: '5.2 ha • Organic Farming',
                extra: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(height: 25),
                    const Text(
                      'Mga Itinatanim na Pananim',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _cropChip('🍅 Kamatis'),
                        _cropChip('🍌 Saging'),
                        _cropChip('🌽 Mais'),
                        _cropChip('🥒 Upo'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _statCard(
                Icons.star,
                'Reliability Score',
                '95%',
                'Napakataas',
              ),
            ],

            // BUYER PROFILE
            if (isBuyer) ...[
              _infoCard(
                icon: Icons.shopping_bag,
                title: 'Buyer Information',
                subtitle: store.email.isNotEmpty
                    ? store.email
                    : 'buyer@example.com',
                details: 'Customer Account',
              ),
              const SizedBox(height: 12),
              _statCard(
                Icons.shopping_bag_outlined,
                'My Orders',
                '0',
                'Total Orders',
              ),
              const SizedBox(height: 12),
              _statCard(
                Icons.favorite_border,
                'Saved Products',
                '0',
                'Favorite Products',
              ),
            ],

            // COOPERATIVE PROFILE
            if (isCooperative) ...[
              _infoCard(
                icon: Icons.groups,
                title: 'San Isidro Cooperative',
                subtitle: 'Cooperative Address',
                details: 'Registered Cooperative',
              ),
              const SizedBox(height: 12),
              _statCard(
                Icons.people,
                'Cooperative Members',
                '0',
                'Registered Members',
              ),
              const SizedBox(height: 12),
              _statCard(
                Icons.inventory_2,
                'Products Monitored',
                '0',
                'Available Products',
              ),
            ],

            // LGU PROFILE
            if (isLgu) ...[
              _infoCard(
                icon: Icons.account_balance,
                title: 'Local Government Office',
                subtitle: 'Municipality / City',
                details: 'Government Account',
              ),
              const SizedBox(height: 12),
              _statCard(
                Icons.agriculture,
                'Farmers Monitored',
                '0',
                'Registered Farmers',
              ),
              const SizedBox(height: 12),
              _statCard(
                Icons.assessment,
                'Agricultural Reports',
                '0',
                'Available Reports',
              ),
            ],

            const SizedBox(height: 18),

            // ROLE-SPECIFIC MENU
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                children: List.generate(
                  menuItems.length,
                  (index) {
                    final item = menuItems[index];

                    return Column(
                      children: [
                        ListTile(
                          dense: true,
                          leading: Icon(
                            item['icon'] as IconData,
                            color: forest,
                            size: 22,
                          ),
                          title: Text(
                            item['title'] as String,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ink,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.chevron_right,
                            size: 20,
                            color: Colors.black38,
                          ),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${item['title']} is not connected yet.',
                                ),
                              ),
                            );
                          },
                        ),
                        if (index != menuItems.length - 1)
                          const Divider(
                            height: 1,
                            indent: 16,
                            endIndent: 16,
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // LOGOUT
            TextButton.icon(
              onPressed: () {
                store.customerName = '';
                store.email = '';

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SignInScreen(),
                  ),
                  (_) => false,
                );
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.redAccent,
              ),
              label: const Text(
                'Mag-logout',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String details,
    Widget? extra,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: pale,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: forest, size: 28),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: ink,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      details,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (extra != null) extra,
        ],
      ),
    );
  }

  Widget _statCard(
    IconData icon,
    String title,
    String value,
    String description,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.amber, size: 38),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: forest,
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: forest,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cropChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: pale,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
