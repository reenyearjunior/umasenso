import 'package:flutter/material.dart';
import '../app_shared.dart';
import 'cart_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Produce item;
  const ProductDetailsScreen({super.key, required this.item});
  @override State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}
class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final p = widget.item;
    return Scaffold(appBar: AppBar(title: const Text('Product details')), body: ListView(padding: const EdgeInsets.all(20), children: [
      Container(height: 210, decoration: BoxDecoration(color: pale, borderRadius: BorderRadius.circular(26)),
        child: Center(child: Text(p.emoji, style: const TextStyle(fontSize: 100)))),
      const SizedBox(height: 20),
      Text(p.name, style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: ink)),
      const SizedBox(height: 8),
      Row(children: [
        Text('₱${p.price}/${p.unit}', style: const TextStyle(fontSize: 21, color: forest, fontWeight: FontWeight.bold)),
        const Spacer(), const Icon(Icons.star, color: Colors.amber), Text('${p.rating}'),
      ]),
      const SizedBox(height: 18),
      Text(p.description, style: const TextStyle(fontSize: 15, height: 1.5)),
      const SizedBox(height: 16),
      ListTile(contentPadding: EdgeInsets.zero, leading: const CircleAvatar(backgroundColor: pale, child: Icon(Icons.person, color: forest)),
        title: Text(p.farmer, style: const TextStyle(fontWeight: FontWeight.bold)), subtitle: Text('Local farmer • ${p.location}')),
      const Divider(height: 30),
      const Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold)),
      Row(children: [
        IconButton(onPressed: () => setState(() { if (quantity > 1) quantity--; }), icon: const Icon(Icons.remove_circle_outline)),
        Text('$quantity ${p.unit}', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        IconButton(onPressed: () => setState(() => quantity++), icon: const Icon(Icons.add_circle_outline)),
      ]),
      const SizedBox(height: 16),
      FilledButton(onPressed: () {
        store.add(p, quantity);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$quantity ${p.unit} of ${p.name} added to cart')));
      }, child: Text('Add to cart • ₱${p.price * quantity}')),
      const SizedBox(height: 8),
      OutlinedButton.icon(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen())),
        icon: const Icon(Icons.shopping_basket_outlined), label: const Text('View cart')),
    ]));
  }
}
