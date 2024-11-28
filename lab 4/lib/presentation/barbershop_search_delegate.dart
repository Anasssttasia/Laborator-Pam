import 'package:flutter/material.dart';
import 'package:my_flutter_app/domain/barbershop_entity.dart';
import 'package:my_flutter_app/presentation/barbershop_card.dart';

class BarbershopSearchDelegate extends SearchDelegate {
  final List<Barbershop> barbershops;

  BarbershopSearchDelegate(this.barbershops);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = barbershops.where((shop) {
      return shop.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView(
      children: results.map<Widget>((shop) {
        return BarbershopCard(shop: shop);
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = barbershops.where((shop) {
      return shop.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView(
      children: suggestions.map<Widget>((shop) {
        return ListTile(
          title: Text(shop.title),
          onTap: () {
            query = shop.title;
            showResults(context);
          },
        );
      }).toList(),
    );
  }
}
