class Product {
  final String id;
  final String title;
  final String subtitle;
  final double price;
  final String image; // asset path
  bool isFavorite;
  Product({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
    this.isFavorite = false,
  });
}