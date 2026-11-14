
import 'package:flutter/material.dart';
import '../app_shared.dart';
import '../widgets/produce_tile.dart';
import 'product_details_screen.dart';

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({super.key});

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  String query = '';
  String category = 'All';

  final categories = const [
    'All',
    'Vegetables',
    'Fruits',
    'Grains',
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = produceList.where((p) {
      final matchesCategory =
          category == 'All' || p.category == category;

      final matchesSearch =
          '${p.name} ${p.farmer} ${p.location}'
              .toLowerCase()
              .contains(query.toLowerCase());

      return matchesCategory && matchesSearch;
    }).toList();

    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(18, 18, 18, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Marketplace',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: ink,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Search produce or farmers',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),

          SizedBox(
            height: 58,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              children: categories.map((c) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(c),
                    selected: category == c,
                    onSelected: (_) {
                      setState(() {
                        category = c;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          Expanded(
            child: filtered.isEmpty
                ? const Center(
                    child: Text(
                      'No products found. Try another search.',
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(
                      18, 4, 18, 90,
                    ),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final product = filtered[index];

                      return ProduceTile(
                        item: product,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ProductDetailsScreen(item: product),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
