import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/sample_data.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../models/cart_model.dart';
import 'cart_screen.dart';
//تعريف الشاشة
class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
//حالة الشاشة
class _HomeScreenState extends State<HomeScreen> {
  late List<Product> products;
  @override
  void initState() {
    super.initState();
    products = sampleProducts();
  }
//إضافة منتج للسلة
  void _onProductTap(Product p) {
    // add directly to cart and navigate to cart screen
    Provider.of<CartModel>(context, listen: false).addProduct(p);
    Navigator.pushNamed(context, CartScreen.routeName);
  }
//ضافة/إزالة من المفضلة
  void _toggleFav(Product p) {
    setState(() {
      p.isFavorite = !p.isFavorite;
    });
  }
//تصميم الشاشة
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Hello,\nsteven ashraf', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          Padding(padding: EdgeInsets.only(right:12), child: CircleAvatar(backgroundColor: Colors.orangeAccent, child: Icon(Icons.person, color: Colors.white)))
        ],
      ),
      //جسم الصفحة (Body)
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.72,
                children: products.map((p) => ProductCard(
                  product: p,
                  onTap: () => _onProductTap(p),
                  onToggleFavorite: () => _toggleFav(p),
                )).toList(),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}