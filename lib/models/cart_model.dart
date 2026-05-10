import 'package:flutter/foundation.dart';
import 'product.dart';
import 'cart_item.dart';

class CartModel extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();

  void addProduct(Product p) {
    if (_items.containsKey(p.id)) {
      _items[p.id]!.qty += 1;
    } else {
      _items[p.id] = CartItem(product: p, qty: 1);
    }
    notifyListeners();
  }

  void removeProduct(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void increaseQty(String productId) {
    if (_items.containsKey(productId)) {
      _items[productId]!.qty += 1;
      notifyListeners();
    }
  }

  void decreaseQty(String productId) {
    if (_items.containsKey(productId)) {
      if (_items[productId]!.qty > 1) {
        _items[productId]!.qty -= 1;
      } else {
        _items.remove(productId);
      }
      notifyListeners();
    }
  }

  double get total => _items.values.fold(0.0, (t, i) => t + i.product.price * i.qty);

  int get totalItems => _items.values.fold(0, (s, i) => s + i.qty);

  void clear() {
    _items.clear();
    notifyListeners();
  }
}