import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:my_flutter_app/domain/barbershop_entity.dart';

// Asigură-te că importul este corect

class BarbershopRepositoryImpl implements BarbershopRepository {
  @override
  Future<List<Barbershop>> getAllBarbershops() async {
    try {
      // Încarcă fișierul JSON din assets
      final jsonString = await rootBundle.loadString('assets/barbershops.json');

      // Decodează string-ul JSON într-un Map
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);

      // Verifică dacă cheia "allBarbershops" există în JSON
      if (!jsonData.containsKey('allBarbershops')) {
        throw Exception('Cheia "allBarbershops" nu există în JSON');
      }

      // Accesăm lista de barbershops din JSON
      final List<dynamic> barbershopsData = jsonData['allBarbershops'];

      // Mapează JSON-ul într-o listă de obiecte Barbershop
      return barbershopsData.map((json) => Barbershop.fromJson(json)).toList();
    } catch (e) {
      // În caz de eroare, afișează mesajul și returnează o listă goală
      print('Eroare la încărcarea barbershops: $e');
      return []; // Returnează o listă goală în caz de eroare
    }
  }
}
