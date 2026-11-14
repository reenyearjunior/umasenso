import 'package:flutter/material.dart';
import '../app_shared.dart';

class ProduceTile extends StatelessWidget {
  final Produce item;
  final VoidCallback onTap;
  const ProduceTile({super.key, required this.item, required this.onTap});
  @override
  Widget build(BuildContext context) => Card(
    color: Colors.white, elevation: 0, margin: const EdgeInsets.only(bottom: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18), side: const BorderSide(color: Color(0xFFE7EFE1))),
    child: InkWell(borderRadius: BorderRadius.circular(18), onTap: onTap,
      child: Padding(padding: const EdgeInsets.all(12), child: Row(children: [
        Container(width: 76, height: 76, decoration: BoxDecoration(color: pale, borderRadius: BorderRadius.circular(14)),
          child: Center(child: Text(item.emoji, style: const TextStyle(fontSize: 39)))),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(item.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ink)),
          const SizedBox(height: 4),
          Text('${item.farmer} • ${item.location}', style: const TextStyle(fontSize: 12, color: Colors.black54)),
          const SizedBox(height: 6),
          Row(children: [
            Text('₱${item.price}/${item.unit}', style: const TextStyle(fontWeight: FontWeight.bold, color: forest)),
            const SizedBox(width: 8), const Icon(Icons.star, color: Colors.amber, size: 15),
            Text('${item.rating}', style: const TextStyle(fontSize: 12)),
          ]),
        ])),
        IconButton(onPressed: () {
          store.add(item);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${item.name} added to cart'), duration: const Duration(seconds: 1)));
        }, icon: const Icon(Icons.add_circle, color: forest, size: 30)),
      ]))),
  );
}
