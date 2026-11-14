import 'package:flutter/material.dart';
import '../app_shared.dart';

class SummaryCard extends StatelessWidget {
  final IconData icon;
  final String title, value;
  const SummaryCard({super.key, required this.icon, required this.title, required this.value});
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: pale, borderRadius: BorderRadius.circular(18)),
    child: Row(children: [
      Icon(icon, color: forest, size: 28), const SizedBox(width: 10),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontSize: 12, color: Colors.black54)),
        Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: ink)),
      ])),
    ]));
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.only(bottom: 12),
    child: Text(title, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: ink)));
}
