import '../models/product.dart';

List<Product> sampleProducts() {
  return [
    Product(id: 'p1', title: 'Jacket Boucle', subtitle: 'Men\'s Fashion', price: 72.59, image: 'assets/images/item1.png'),
    Product(id: 'p2', title: 'Jacket Boucle', subtitle: 'Women\'s Fashion', price: 72.59, image: 'assets/images/item2.png'),
    Product(id: 'p3', title: 'Leather Jacket', subtitle: 'Men\'s Fashion', price: 85.00, image: 'assets/images/item3.png'),
    Product(id: 'p4', title: 'Casual Jacket', subtitle: 'Women\'s Fashion', price: 65.00, image: 'assets/images/item4.png'),
  ];
}