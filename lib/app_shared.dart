import 'package:flutter/material.dart';

const forest = Color(0xFF17683A);
const leaf = Color(0xFF2E8B50);
const pale = Color(0xFFF0F7E9);
const cream = Color(0xFFFFFEF8);
const ink = Color(0xFF183B27);

class Produce {
  final String name, category, farmer, location, emoji, description;
  final int price;
  final String unit;
  final double rating;
  const Produce({
    required this.name, required this.category, required this.farmer,
    required this.location, required this.emoji, required this.price,
    required this.unit, required this.rating, required this.description,
  });
}

const produceList = <Produce>[
  Produce(name: 'Fresh Tomatoes', category: 'Vegetables', farmer: 'Juan Dela Cruz', location: 'Leyte', emoji: '🍅', price: 75, unit: 'kg', rating: 4.9, description: 'Freshly harvested tomatoes from a local family farm.'),
  Produce(name: 'Sweet Mangoes', category: 'Fruits', farmer: 'Maria Santos', location: 'Samar', emoji: '🥭', price: 120, unit: 'kg', rating: 4.8, description: 'Sweet mangoes picked from a small local orchard.'),
  Produce(name: 'Organic Rice', category: 'Grains', farmer: 'Pedro Ramos', location: 'Leyte', emoji: '🌾', price: 58, unit: 'kg', rating: 4.7, description: 'Locally grown rice, carefully dried and packed.'),
  Produce(name: 'Fresh Eggplant', category: 'Vegetables', farmer: 'Liza Garcia', location: 'Samar', emoji: '🍆', price: 65, unit: 'kg', rating: 4.6, description: 'Tender eggplants harvested in small batches.'),
  Produce(name: 'Farm Bananas', category: 'Fruits', farmer: 'Ramon Flores', location: 'Eastern Samar', emoji: '🍌', price: 55, unit: 'kg', rating: 4.8, description: 'Fresh bunches from a local farm.'),
  Produce(name: 'Green Peppers', category: 'Vegetables', farmer: 'Ana Reyes', location: 'Leyte', emoji: '🫑', price: 90, unit: 'kg', rating: 4.5, description: 'Crisp green peppers for everyday cooking.'),
  Produce(name: 'Fresh Carrots', category: 'Vegetables', farmer: 'Nestor Cruz', location: 'Samar', emoji: '🥕', price: 85, unit: 'kg', rating: 4.6, description: 'Crunchy carrots sorted and packed after harvest.'),
  Produce(name: 'Sweet Pineapple', category: 'Fruits', farmer: 'Gloria Tan', location: 'Leyte', emoji: '🍍', price: 95, unit: 'piece', rating: 4.7, description: 'Juicy pineapple from a nearby grower.'),
];

class OrderRecord {
  final String id;
  final DateTime date;
  final int total;
  final Map<Produce, int> items;
  String status;
  OrderRecord({required this.id, required this.date, required this.total, required this.items, this.status = 'Order placed'});
}

class StoreState extends ChangeNotifier {
  final Map<Produce, int> cart = {};
  final List<OrderRecord> orders = [];
  String customerName = 'Guest User';
  String email = '';
  int get itemCount => cart.values.fold(0, (sum, qty) => sum + qty);
  int get total => cart.entries.fold(0, (sum, e) => sum + e.key.price * e.value);

  void add(Produce item, [int qty = 1]) {
    cart[item] = (cart[item] ?? 0) + qty;
    notifyListeners();
  }
  void decrement(Produce item) {
    final qty = cart[item] ?? 0;
    if (qty <= 1) {
      cart.remove(item);
    } else {
      cart[item] = qty - 1;
    }
    notifyListeners();
  }
  void remove(Produce item) { cart.remove(item); notifyListeners(); }
  void placeOrder() {
    if (cart.isEmpty) return;
    orders.insert(0, OrderRecord(
      id: 'UM${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
      date: DateTime.now(),
      total: total,
      items: Map<Produce, int>.from(cart),
    ));
    cart.clear();
    notifyListeners();
  }
}
final store = StoreState();
