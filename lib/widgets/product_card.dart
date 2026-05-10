import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final VoidCallback onToggleFavorite;
  const ProductCard({super.key, required this.product, required this.onTap, required this.onToggleFavorite});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // tap will add to cart and navigate (handled by parent)
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0,2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  child: AspectRatio(
                    aspectRatio: 1.1,
                    child: Image.asset(product.image, fit: BoxFit.cover, errorBuilder: (ctx, e, st) {
                      return Container(color: Color(0xFFF0F0F5), child: Center(child: Icon(Icons.image, size: 48, color: Colors.grey)));
                    }),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: GestureDetector(
                    onTap: onToggleFavorite,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border, color: product.isFavorite ? Colors.red : Colors.black54),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(product.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Text(product.subtitle, style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Text('£' + product.price.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold)),
              ]),
            )
          ],
        ),
      ),
    );
  }
}