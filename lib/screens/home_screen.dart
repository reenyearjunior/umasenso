import 'package:flutter/material.dart';
import '../app_shared.dart';
import '../widgets/common_widgets.dart';
import '../widgets/produce_tile.dart';
import 'product_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onShop, onOrders;
  const HomeScreen({super.key, required this.onShop, required this.onOrders});
  @override
  Widget build(BuildContext context) => SafeArea(child: ListView(padding: const EdgeInsets.all(18), children: [
    Row(children: [
      const CircleAvatar(backgroundColor: pale, child: Text('🌿', style: TextStyle(fontSize: 24))),
      const SizedBox(width: 10),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(' ${store.customerName}', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ink)),
      ])),
      IconButton(onPressed: onOrders, icon: const Icon(Icons.notifications_none, color: forest)),
    ]),
    const SizedBox(height: 18),
    Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(
      gradient: const LinearGradient(colors: [Color(0xFF164B2B), Color(0xFF2F8A4B)]),
      borderRadius: BorderRadius.circular(24)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Fresh from local farms', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('Support farmers. Shop fresh. Grow together.', style: TextStyle(color: Colors.white70)),
        const SizedBox(height: 18),
        FilledButton.icon(onPressed: onShop, icon: const Icon(Icons.shopping_bag_outlined), label: const Text('Shop products'),
          style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: forest)),
      ]),
    ),
    const SizedBox(height: 22),
    const SectionTitle('Your dashboard'),
    Row(children: [
      Expanded(child: SummaryCard(icon: Icons.shopping_basket_outlined, title: 'Cart items', value: '${store.itemCount}')),
      const SizedBox(width: 12),
      Expanded(child: SummaryCard(icon: Icons.receipt_long_outlined, title: 'Orders', value: '${store.orders.length}')),
    ]),
    const SizedBox(height: 22),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const SectionTitle('Popular products'),
      TextButton(onPressed: onShop, child: const Text('See all')),
    ]),
    ...produceList.take(4).map((p) => ProduceTile(item: p, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailsScreen(item: p))))),
    Container(margin: const EdgeInsets.only(top: 10), padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: pale, borderRadius: BorderRadius.circular(18)),
      child: const Row(children: [Icon(Icons.eco_outlined, size: 34, color: forest), SizedBox(width: 12),
        Expanded(child: Text('Buy local and help small farmers reach more customers.', style: TextStyle(color: ink, fontWeight: FontWeight.w600)))])),
  ]));
}
