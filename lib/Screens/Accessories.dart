import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../accessories_pages/boots_page.dart';
import '../accessories_pages/gloves_page.dart';
import '../accessories_pages/helmets_page.dart';
import '../accessories_pages/jackets_page.dart';

class AccessoriesPage extends StatelessWidget {
  const AccessoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, //
      appBar: AppBar(
        title: const Text(
          'Accessories',
          style: TextStyle(
            fontSize: 24, //
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
              SizedBox(
                width: 250,
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HelmetsPage()),
                    );
                  },
                  icon: SvgPicture.asset(
                    'assets/61610341542283976.svg',
                    width: 30,
                    height: 30,
                  ),
                  label: const Text('Helmets', style: TextStyle(fontSize: 25)),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 250,
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GlovesPage()),
                    );
                  },
                  icon: SvgPicture.asset(
                    'assets/17969960981642673714.svg',
                    width: 55,
                    height: 55,
                  ),
                  label: const Text('Gloves', style: TextStyle(fontSize: 25)),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 250,
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const JacketsPage()),
                    );
                  },
                  icon: SvgPicture.asset(
                    'assets/11861812281674290113.svg',
                    width: 40,
                    height: 40,
                  ),
                  label: const Text('Jackets', style: TextStyle(fontSize: 25)),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 250,
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BootsPage()),
                    );
                  },
                  icon: SvgPicture.asset(
                    'assets/13641006921680328735.svg',
                    width: 50,
                    height: 50,
                  ),
                  label: const Text('Boots', style: TextStyle(fontSize: 25)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
