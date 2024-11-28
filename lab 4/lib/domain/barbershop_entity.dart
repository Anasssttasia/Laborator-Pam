class Barbershop {
  final String title;
  final String location;
  final double rating;
  final String imagePath;

  Barbershop({
    required this.title,
    required this.location,
    required this.rating,
    required this.imagePath,
  });

  factory Barbershop.fromJson(Map<String, dynamic> json) {
    return Barbershop(
      title: json['title'],
      location: json['location'],
      rating: json['rating'],
      imagePath: json['imagePath'],
    );
  }
}
