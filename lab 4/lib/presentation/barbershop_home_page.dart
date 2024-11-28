// barbershop_home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_app/presentation/barbershop_card.dart';
import 'package:my_flutter_app/presentation/barbershop_search_delegate.dart';
import 'package:my_flutter_app/presentation/barbershop_controller.dart';

class BarbershopHomePage extends StatelessWidget {
  final BarbershopController controller = Get.put(BarbershopController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barbershop Booking'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: BarbershopSearchDelegate(controller.barbershops),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Settings action
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.barbershops.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.barbershops.length,
          itemBuilder: (context, index) {
            final shop = controller.barbershops[index];
            return BarbershopCard(shop: shop);
          },
        );
      }),
    );
  }
}
