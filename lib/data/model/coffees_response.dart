class Coffee {
  final int id;
  final String title;
  final String description;
  final double price;
  final String country;
  final String? image;

  Coffee({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.country,
    this.image,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      // Convertimos a double por seguridad ya que en el JSON viene como número
      price: (json['price'] as num).toDouble(),
      country: json['country'] ?? '',
      image: json['image']?.toString(),
    );
  }
}
