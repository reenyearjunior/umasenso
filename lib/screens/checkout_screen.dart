import 'package:flutter/material.dart';
import '../app_shared.dart';


class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});
  @override State<CheckoutScreen> createState() => _CheckoutScreenState();
}
class _CheckoutScreenState extends State<CheckoutScreen> {
  final address = TextEditingController();
  String payment = 'Cash on delivery';
  @override void dispose() { address.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Checkout')),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      const Text('Delivery details', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: ink)),
      const SizedBox(height: 14),
      TextField(controller: address, maxLines: 3, decoration: const InputDecoration(labelText: 'Complete delivery address', alignLabelWithHint: true, prefixIcon: Icon(Icons.location_on_outlined))),
      const SizedBox(height: 22),
      const Text('Payment method', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      RadioListTile<String>(value: 'Cash on delivery', groupValue: payment, onChanged: (v) => setState(() => payment = v!), title: const Text('Cash on delivery'), secondary: const Icon(Icons.payments_outlined)),
      RadioListTile<String>(value: 'GCash (demo)', groupValue: payment, onChanged: (v) => setState(() => payment = v!), title: const Text('GCash'), secondary: const Icon(Icons.account_balance_wallet_outlined)),
      const SizedBox(height: 12),
      Card(color: pale, elevation: 0, child: Padding(padding: const EdgeInsets.all(16), child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Items'), Text('${store.itemCount}')]),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Total'), Text('₱${store.total}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: forest))]),
      ]))),
      const SizedBox(height: 18),
      FilledButton(onPressed: () {
        if (address.text.trim().isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Enter your delivery address.')));
          return;
        }
        store.placeOrder();
        showDialog<void>(context: context, barrierDismissible: false, builder: (dialogContext) => AlertDialog(
          icon: const Icon(Icons.check_circle, color: forest, size: 48),
          title: const Text('Order placed!'),
          content: Text('Your demo order has been recorded. Payment: $payment.'),
          actions: [FilledButton(onPressed: () {
            Navigator.pop(dialogContext);
            Navigator.pop(context);
            Navigator.pop(context);
          }, child: const Text('View orders'))],
        ));
      }, child: const Text('Place order')),
      const SizedBox(height: 10),
      const Text('Checkout is a local demo. It does not charge money or send orders to a real store.', style: TextStyle(fontSize: 12, color: Colors.black54)),
    ]),
  );
}
