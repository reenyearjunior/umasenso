import 'package:flutter/material.dart';
import '../app_shared.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override State<CartScreen> createState() => _CartScreenState();
}
class _CartScreenState extends State<CartScreen> {
  @override void initState() { super.initState(); store.addListener(refresh); }
  @override void dispose() { store.removeListener(refresh); super.dispose(); }
  void refresh() { if (mounted) setState(() {}); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Your cart')),
    body: store.cart.isEmpty
      ? const Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.shopping_basket_outlined, size: 60, color: forest), SizedBox(height: 12), Text('Your cart is empty')]))
      : Column(children: [
        Expanded(child: ListView(padding: const EdgeInsets.all(16), children: store.cart.entries.map((e) => Card(
          color: Colors.white, elevation: 0,
          child: ListTile(
            leading: Text(e.key.emoji, style: const TextStyle(fontSize: 32)),
            title: Text(e.key.name),
            subtitle: Text('₱${e.key.price} × ${e.value} = ₱${e.key.price * e.value}'),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              IconButton(onPressed: () => store.decrement(e.key), icon: const Icon(Icons.remove_circle_outline)),
              Text('${e.value}'),
              IconButton(onPressed: () => store.add(e.key), icon: const Icon(Icons.add_circle_outline)),
              IconButton(onPressed: () => store.remove(e.key), icon: const Icon(Icons.delete_outline, color: Colors.red)),
            ]),
          ),
        )).toList())),
        Container(padding: const EdgeInsets.all(20), decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('₱${store.total}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: forest)),
            ]),
            const SizedBox(height: 14),
            FilledButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckoutScreen())), child: const Text('Proceed to checkout')),
          ]),
        ),
      ]),
  );
}
