import 'package:flutter/material.dart';
import '../app_shared.dart';
import 'home_screen.dart';
import 'marketplace_screen.dart';
import 'orders_screen.dart';
import 'profile_screen.dart';
import 'cart_screen.dart';
import 'community_screen.dart';

class AppShell extends StatefulWidget {
  final String role;

  const AppShell({
    super.key,
    this.role = 'Magsasaka',
  });

  @override
  State<AppShell> createState() => _AppShellState();
}
class _AppShellState extends State<AppShell> {
  int index = 0;
  @override void initState() { super.initState(); store.addListener(refresh); }
  @override void dispose() { store.removeListener(refresh); super.dispose(); }
  void refresh() { if (mounted) setState(() {}); }

  @override
  Widget build(BuildContext context) {
    final pages = [
  HomeScreen(onShop: () => setState(() => index = 1), onOrders: () => setState(() => index = 2)),
  const MarketplaceScreen(),
  const OrdersScreen(),
  const CommunityScreen(),
  ProfileScreen(role: widget.role),
    ];
    return Scaffold(
      body: IndexedStack(index: index, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.storefront_outlined), selectedIcon: Icon(Icons.storefront), label: 'Market'),
          NavigationDestination(icon: Icon(Icons.receipt_long_outlined), selectedIcon: Icon(Icons.receipt_long), label: 'Mga Order'),
          NavigationDestination(icon: Icon(Icons.groups_outlined),selectedIcon: Icon(Icons.groups), label: 'Komunidad',),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: index == 1 && store.itemCount > 0
        ? FloatingActionButton.extended(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen())),
            icon: const Icon(Icons.shopping_basket_outlined), label: Text('Cart (${store.itemCount})'))
        : null,
    );
  }
}
