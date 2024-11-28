import 'package:flutter/material.dart';
import 'package:my_flutter_app/domain/barbershop_entity.dart';

class BarbershopCard extends StatelessWidget {
  final Barbershop shop;

  BarbershopCard({required this.shop});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(shop.imagePath,
            width: 60, height: 60, fit: BoxFit.cover),
        title: Text(shop.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.deepPurple),
                SizedBox(width: 4),
                Text(shop.location),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.amber),
                SizedBox(width: 4),
                Text('${shop.rating}'),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.calendar_today_outlined),
          onPressed: () {
            // Booking action
          },
        ),
      ),
    );
  }
}
