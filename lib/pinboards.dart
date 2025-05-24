import 'package:flutter/material.dart';
import 'profile.dart';
import 'home_screen.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PinboardsScreen extends StatelessWidget {
  const PinboardsScreen({super.key});

  // Hardcoded pinboard data
  final List<Map<String, String>> pinboards = const [
    {
      'name': 'Nature',
      'coverImg': 'graphics/pinboard/pin1.jpg',
    },
    {
      'name': 'Portraits',
      'coverImg': 'graphics/pinboard/pin2.jpg',
    },
    {
      'name': 'Digital Art',
      'coverImg': 'graphics/pinboard/pin3.jpg',
    },
    {
      'name': 'Sketches',
      'coverImg': 'graphics/pinboard/pin4.jpg',
    },
    {
      'name': 'Fantasy',
      'coverImg': 'graphics/pinboard/pin5.jpg',
    },
    {
      'name': 'Crochet',
      'coverImg': 'graphics/pinboard/pin6.jpg',
    },
    {
      'name': 'Realistic Art',
      'coverImg': 'graphics/pinboard/pin7.jpg',
    },
    {
      'name': 'Anime',
      'coverImg': 'graphics/pinboard/pin8.jpg',
    },
    {
      'name': 'Abstract',
      'coverImg': 'graphics/pinboard/pin9.jpg',
    },
    {
      'name': 'Glass Art',
      'coverImg': 'graphics/pinboard/pin10.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TOP NAVIGATION AREA
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('graphics/Logo 2 B.png', width: 40, height: 40),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chat_bubble_outline),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications_none_outlined),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // SEARCH BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Search your saved arts',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // PINBOARD GRID
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: pinboards.length,
                itemBuilder: (context, index) {
                  final board = pinboards[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(board['coverImg']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            board['name']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // BOTTOM NAVBAR
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.push_pin_outlined),
              color: const Color.fromRGBO(20, 193, 225, 100),
              onPressed: () {},
            ),
            IconButton(icon: const Icon(Icons.add), onPressed: () {}),
            IconButton(icon: const Icon(LucideIcons.vault), onPressed: () {}),
            IconButton(
              icon: const Icon(TDIcons.user),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
