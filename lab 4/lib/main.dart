import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BarbershopApp());
}

class BarbershopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barbershop Booking',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BarbershopHomePage(),
    );
  }
}

class BarbershopController extends GetxController {
  var data = <String, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
    // Exemplu de date fictive
    data.value = {
      'user': {
        'name': 'John Doe',
        'location': 'New York',
        'profileImage': 'assets/images/profile.jpg'
      },
      'nearestBarbershops': [
        {
          'title': 'Barbershop 1',
          'location': '123 Main St',
          'rating': 4.5,
          'imagePath': 'assets/images/barbershop1.jpg'
        },
        {
          'title': 'Barbershop 2',
          'location': '456 Oak St',
          'rating': 4.2,
          'imagePath': 'assets/images/barbershop2.jpg'
        },
        // Adaugă mai multe barbershops
      ],
      'mostRecommended': {
        'imagePath': 'assets/images/barbershop1.jpg',
      },
      'allBarbershops': [
        {
          'title': 'Barbershop 1',
          'location': '123 Main St',
          'rating': 4.5,
          'imagePath': 'assets/images/barbershop1.jpg'
        },
        {
          'title': 'Barbershop 2',
          'location': '456 Oak St',
          'rating': 4.2,
          'imagePath': 'assets/images/barbershop2.jpg'
        },
        // Adaugă mai multe barbershops
      ],
      'banner': {
        'imagePath': 'assets/images/banner.jpg',
      }
    };
  }
}

class BarbershopHomePage extends StatelessWidget {
  final BarbershopController controller = Get.put(BarbershopController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barbershop Booking'),
        actions: [
          // Search icon
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: BarbershopSearchDelegate(
                    controller.data['allBarbershops'] ?? []),
              );
            },
          ),
          // Settings icon
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Action for settings (you can navigate to a settings page)
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.data.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        final userInfo = controller.data['user'];
        final nearestBarbershops =
            controller.data['nearestBarbershops'] as List;
        final mostRecommended = controller.data['mostRecommended'];
        final allBarbershops = controller.data['allBarbershops'] as List;

        return SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(userInfo['profileImage']),
                    radius: 25,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userInfo['name'],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(userInfo['location']),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(controller.data['banner']['imagePath']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: IconButton(
                      icon: Icon(Icons.book_online, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Nearest Barbershop',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: nearestBarbershops.length,
                itemBuilder: (context, index) {
                  final shop = nearestBarbershops[index];
                  return BarbershopCard(
                    title: shop['title'],
                    location: shop['location'],
                    rating: shop['rating'],
                    imagePath: shop['imagePath'],
                  );
                },
              ),
              SizedBox(height: 24),
              Text(
                'Most Recommended',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(mostRecommended['imagePath']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: IconButton(
                      icon: Icon(Icons.book_online, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'All Barbershops',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: allBarbershops.length,
                itemBuilder: (context, index) {
                  final shop = allBarbershops[index];
                  return BarbershopCard(
                    title: shop['title'],
                    location: shop['location'],
                    rating: shop['rating'],
                    imagePath: shop['imagePath'],
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}

class BarbershopCard extends StatelessWidget {
  final String title;
  final String location;
  final double rating;
  final String imagePath;

  BarbershopCard({
    required this.title,
    required this.location,
    required this.rating,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading:
            Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.deepPurple),
                SizedBox(width: 4),
                Text(location),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.amber),
                SizedBox(width: 4),
                Text('$rating'),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.calendar_today_outlined),
          onPressed: () {
            // Action for booking
          },
        ),
      ),
    );
  }
}

class BarbershopSearchDelegate extends SearchDelegate {
  final List barbershops;

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
      return shop['title'].toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView(
      children: results.map<Widget>((shop) {
        return BarbershopCard(
          title: shop['title'],
          location: shop['location'],
          rating: shop['rating'],
          imagePath: shop['imagePath'],
        );
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = barbershops.where((shop) {
      return shop['title'].toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView(
      children: suggestions.map<Widget>((shop) {
        return BarbershopCard(
          title: shop['title'],
          location: shop['location'],
          rating: shop['rating'],
          imagePath: shop['imagePath'],
        );
      }).toList(),
    );
  }
}
