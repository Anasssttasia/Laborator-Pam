import 'package:flutter/material.dart';

void main() {
  runApp(BarbershopApp());
}

class BarbershopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

class BarbershopHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User info section
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                  radius: 25,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Joe Samanta',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Yogyakarta'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),

            // Banner section
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage('assets/images/banner.jpg'),
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

            // Search Bar Section
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Barbershop...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onChanged: (value) {},
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.settings), // Iconiță pentru setări
                  onPressed: () {
                    // Navigate to settings page or perform desired action
                  },
                ),
              ],
            ),
            SizedBox(height: 24),

            // Nearest Barbershop section
            Text(
              'Nearest Barbershop',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            BarbershopCard(
              title: 'Alana Barbershop - Haircut & Massage',
              location: 'Banguntapan (5 km)',
              rating: 4.5,
              imagePath: 'assets/images/barbershop1.jpg',
            ),
            BarbershopCard(
              title: 'Hercha Barbershop - Haircut & Styling',
              location: 'Jalan Kaliurang (8 km)',
              rating: 5.0,
              imagePath: 'assets/images/barbershop2.jpg',
            ),
            BarbershopCard(
              title: 'Barberking - Haircut Styling & Massage',
              location: 'Jogja Expo Centre (12 km)',
              rating: 4.5,
              imagePath: 'assets/images/barbershop3.jpg',
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Navigate to AllBarbershopsPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllBarbershopsPage()),
                );
              },
              child: Text('See All'),
            ),
            SizedBox(height: 24),

            // Most recommended section
            Text(
              'Most Recommended',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage('assets/images/new_banner.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: IconButton(
                        icon: Icon(Icons.book_online,
                            color: Colors.white), // Iconiță rezervare
                        onPressed: () {
                          // Booking action
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8), // Distanță între imagine și text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Masterpiece Barbershop ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Siswo Centre (1 km)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Rating: 5.0',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            Container(
              height: 400,
              child: ListView(
                children: [
                  BarbershopCard(
                    title: 'Masterpiece Barbershop - Haircut Styling',
                    location: 'Jogja Expo Centre (2 km)',
                    rating: 5.0,
                    imagePath: 'assets/images/barbershop4.jpg',
                  ),
                  BarbershopCard(
                    title: 'Varcity Barbershop Jogja ex The Varcher',
                    location: 'Condongcatur (10 km)',
                    rating: 4.5,
                    imagePath: 'assets/images/barbershop5.jpg',
                  ),
                  BarbershopCard(
                    title: 'Twinsky Monkey Barber & Men Stuff',
                    location: 'Jl Taman Siswa (8 km)',
                    rating: 5.0,
                    imagePath: 'assets/images/barbershop6.jpg',
                  ),
                  BarbershopCard(
                    title: 'Barberman - Haircut Styling & Massage',
                    location: 'J-Walk Centre (17 km)',
                    rating: 4.5,
                    imagePath: 'assets/images/barbershop7.jpg',
                  ),
                  // Adaugă mai multe barbershopuri aici
                  BarbershopCard(
                    title: 'The Groom Room - Luxury Barbering',
                    location: 'Prawirotaman (3 km)',
                    rating: 4.8,
                    imagePath: 'assets/images/barbershop8.jpg',
                  ),
                  BarbershopCard(
                    title: 'Classic Cuts - Traditional Barber',
                    location: 'Sleman (6 km)',
                    rating: 4.6,
                    imagePath: 'assets/images/barbershop9.jpg',
                  ),
                  BarbershopCard(
                    title: 'Modern Styles - Contemporary Cuts',
                    location: 'Kota Baru (9 km)',
                    rating: 5.0,
                    imagePath: 'assets/images/barbershop10.jpg',
                  ),
                  BarbershopCard(
                    title: 'Urban Barber - Trendy Hairstyles',
                    location: 'Gondokusuman (11 km)',
                    rating: 4.7,
                    imagePath: 'assets/images/barbershop11.jpg',
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class AllBarbershopsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Barbershops'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          BarbershopCard(
            title: 'Alana Barbershop - Haircut & Massage',
            location: 'Banguntapan (5 km)',
            rating: 4.5,
            imagePath: 'assets/images/barbershop1.jpg',
          ),
          BarbershopCard(
            title: 'Hercha Barbershop - Haircut & Styling',
            location: 'Jalan Kaliurang (8 km)',
            rating: 5.0,
            imagePath: 'assets/images/barbershop2.jpg',
          ),
          BarbershopCard(
            title: 'Barberking - Haircut Styling & Massage',
            location: 'Jogja Expo Centre (12 km)',
            rating: 4.5,
            imagePath: 'assets/images/barbershop3.jpg',
          ),
          BarbershopCard(
            title: 'Masterpiece Barbershop - Haircut Styling',
            location: 'Jogja Expo Centre (2 km)',
            rating: 5.0,
            imagePath: 'assets/images/barbershop4.jpg',
          ),
          BarbershopCard(
            title: 'Varcity Barbershop Jogja ex The Varcher',
            location: 'Condongcatur (10 km)',
            rating: 4.5,
            imagePath: 'assets/images/barbershop5.jpg',
          ),
          BarbershopCard(
            title: 'Twinsky Monkey Barber & Men Stuff',
            location: 'Jl Taman Siswa (8 km)',
            rating: 5.0,
            imagePath: 'assets/images/barbershop6.jpg',
          ),
          BarbershopCard(
            title: 'Barberman - Haircut Styling & Massage',
            location: 'J-Walk Centre (17 km)',
            rating: 4.5,
            imagePath: 'assets/images/barbershop7.jpg',
          ),
          BarbershopCard(
            title: 'The Groom Room - Luxury Barbering',
            location: 'Prawirotaman (3 km)',
            rating: 4.8,
            imagePath: 'assets/images/barbershop8.jpg',
          ),
          BarbershopCard(
            title: 'Classic Cuts - Traditional Barber',
            location: 'Sleman (6 km)',
            rating: 4.6,
            imagePath: 'assets/images/barbershop9.jpg',
          ),
          BarbershopCard(
            title: 'Modern Styles - Contemporary Cuts',
            location: 'Kota Baru (9 km)',
            rating: 5.0,
            imagePath: 'assets/images/barbershop10.jpg',
          ),
          BarbershopCard(
            title: 'Urban Barber - Trendy Hairstyles',
            location: 'Gondokusuman (11 km)',
            rating: 4.7,
            imagePath: 'assets/images/barbershop11.jpg',
          ),
        ],
      ),
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
          icon: Icon(Icons.calendar_today_outlined), // Iconiță pentru rezervare
          onPressed: () {
            // Acțiunea de rezervare
          },
        ),
      ),
    );
  }
}
