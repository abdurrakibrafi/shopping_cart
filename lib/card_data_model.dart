class CardData {
  final String imageUrl;
  final String productName;
  final String color;
  final String size;
  final int price;
  int quantity;

  CardData({
    required this.imageUrl,
    required this.productName,
    required this.color,
    required this.size,
    required this.price,
    this.quantity = 1,
  });
}
