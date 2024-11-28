// Definirea clasei Barbershop
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
}

// Definirea abstractului pentru BarbershopRepository
abstract class BarbershopRepository {
  Future<List<Barbershop>> getAllBarbershops();
}
