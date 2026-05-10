import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import 'checkout_screen.dart';
// تعريف الشاشه
class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});
// بدايه ال bulid
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    return Scaffold(
      // هيكل الشاشه
      appBar: AppBar(title: const Text('My Cart')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // عرض المنتجات
            Expanded(
              child: cart.items.isEmpty
                  ? const Center(child: Text('Your cart is empty'))
                  : ListView.separated(
                itemCount: cart.items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (ctx, i) {
                  final item = cart.items[i];
                  // عنصر المنتج
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          item.product.image,
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 56,
                            height: 56,
                            color: const Color(0xFFEEEFF3),
                            child: const Icon(Icons.image),
                          ),
                        ),
                      ),
                      title: Text(item.product.title),
                      subtitle: Text(
                          '£${item.product.price.toStringAsFixed(2)}   Size: XL'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () =>
                                cart.decreaseQty(item.product.id),
                            icon: const Icon(
                                Icons.remove_circle_outline),
                          ),
                          Text(
                            item.qty.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () =>
                                cart.increaseQty(item.product.id),
                            icon:
                            const Icon(Icons.add_circle_outline),
                          ),
                          IconButton(
                            onPressed: () =>
                                cart.removeProduct(item.product.id),
                            icon: const Icon(Icons.delete_outline,
                                color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            // ملخص الدفع
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Sub total :'),
                      Text(
                        '£${cart.total.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Shipping :'),
                      Text('£12.50',
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  const Divider(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Bag Total :'),
                      Text(
                        '£${(cart.total + 12.5).toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(
                          context, CheckoutScreen.routeName),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        child: Text('Checkout'),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
