import 'package:flutter/material.dart';
import '../app_shared.dart';


class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});
  @override State<OrdersScreen> createState() => _OrdersScreenState();
}
class _OrdersScreenState extends State<OrdersScreen> {
  @override void initState() { super.initState(); store.addListener(refresh); }
  @override void dispose() { store.removeListener(refresh); super.dispose(); }
  void refresh() { if (mounted) setState(() {}); }
  @override
  Widget build(BuildContext context) => SafeArea(child: Column(children: [
    const Padding(padding: EdgeInsets.fromLTRB(18, 20, 18, 12), child: Align(alignment: Alignment.centerLeft,
      child: Text('My orders', style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: ink)))),
    Expanded(child: store.orders.isEmpty
      ? const Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.receipt_long_outlined, size: 60, color: forest), SizedBox(height: 12),
          Text('No orders yet', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(height: 4), Text('Your placed orders will appear here.'),
        ]))
      : ListView.builder(padding: const EdgeInsets.all(16), itemCount: store.orders.length, itemBuilder: (_, i) {
        final order = store.orders[i];
        return Card(color: Colors.white, elevation: 0, margin: const EdgeInsets.only(bottom: 12),
          child: ExpansionTile(
            leading: const CircleAvatar(backgroundColor: pale, child: Icon(Icons.receipt_long, color: forest)),
            title: Text('Order ${order.id}', style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${order.date.day}/${order.date.month}/${order.date.year} • ${order.status}'),
            trailing: Text('₱${order.total}', style: const TextStyle(color: forest, fontWeight: FontWeight.bold)),
            children: order.items.entries.map((e) => ListTile(dense: true, title: Text(e.key.name), subtitle: Text('${e.value} × ₱${e.key.price}'), trailing: Text('₱${e.value * e.key.price}'))).toList(),
          ),
        );
      })),
  ]));
}
