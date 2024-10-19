import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scr/Screens/Accessories.dart';

import '../../adv_bike/adv_bike.dart';
import '../../cro_bike/cro_bike.dart';import '../sport_bike.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String routName = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // Extend the background behind the app bar
      appBar: AppBar(
        title: const Text(
          'NMOTORS',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent, // Making app bar transparent
        elevation: 0, // Remove app bar elevation
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              // Handle home button tap
            },
          ),
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              // Handle login button tap
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              // Handle sign up button tap
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/oo.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BikeCategoryCard(
                category: 'Sports Bikes',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SportsBikesPage()),
                  );
                },
                icon: FontAwesomeIcons
                    .motorcycle, // Use motorcycle icon for Sports Bikes
              ),
              BikeCategoryCard(
                category: 'Adventure Bikes',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdventureBikesPage()),
                  );
                },
                icon: FontAwesomeIcons
                    .motorcycle, // Use motorcycle icon for Adventure Bikes
              ),
              BikeCategoryCard(
                category: 'Cruiser Bikes',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CruiserBikesPage()),
                  );
                },
                icon: FontAwesomeIcons
                    .motorcycle, // Use motorcycle icon for Cruiser Bikes
              ),
              // Add the Accessories category card with a custom icon
              BikeCategoryCard(
                category: 'Accessories',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccessoriesPage()),
                  );
                },
                icon: FontAwesomeIcons.helmetUn,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        // Make the bottom navigation bar transparent
        decoration: const BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(color: Colors.transparent),
          ],
        ),
        child: const CustomBottomNavigationBar(), //
      ),
      extendBody: true,
    );
  }
}

class BikeCategoryCard extends StatelessWidget {
  final String category;
  final VoidCallback onTap;
  final IconData icon;

  const BikeCategoryCard({
    super.key,
    required this.category,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10.0,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            Text(
              category,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
      ],
      onTap: (int index) {
        // Handle navigation bar item taps
        if (index == 0) {
          // Navigate to Home
        } else if (index == 1) {
          // Navigate to Account
        } else if (index == 2) {
          // Navigate to Cart
        }
      },
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
