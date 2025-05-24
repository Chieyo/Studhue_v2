import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> postImages = [
    'graphics/profile posts/post1.jpg',
    'graphics/profile posts/post2.jpg',
    'graphics/profile posts/post3.jpg',
    'graphics/profile posts/post4.jpg',
    'graphics/profile posts/post5.jpg',
    'graphics/profile posts/post6.jpg',
    'graphics/profile posts/post7.jpg',
    'graphics/profile posts/post8.jpg',
    'graphics/profile posts/post9.jpg',
  ];

    return DefaultTabController(
      length: 2, // Posts and Products tabs
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 155),
                        Text(
                          "BIBIMBAP",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Image.asset('graphics/Verified Icon.png'),
                      ],
                    ),
                    Icon(Icons.menu),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Profile
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage('graphics/icons/icon1.jpg'),
                  ),
                  Column(
                    children: [
                      Text(
                        "256",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Posts"),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "974K",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Followers"),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "444",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Following"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Bio
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bibim-Chan",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Digital Artist",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Lorem ipsum dolor amet, consectetuer adipiscing elit. Quam purus leo fermentum.",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Tabs
              TabBar(
                labelColor: Colors.pink,
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.pink,
                tabs: [
                  Tab(icon: Icon(Icons.grid_view), text: "Posts"),
                  Tab(
                    icon: Icon(LucideIcons.shopping_basket),
                    text: "Products",
                  ),
                ],
              ),

              // Tab Views
              Expanded(
                child: TabBarView(
                  children: [
                    // Posts Tab
                    GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: postImages.length,
                      itemBuilder: (context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          postImages[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Products Tab
                    Center(child: Text("Products Coming Soon")),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Bottom Navigation Bar
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 60,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {Navigator.pushNamed(context, "/home");},
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.add_box_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.developer_board_rounded),
                  onPressed: () {Navigator.pushNamed(context, "/vault");},
                ),
                IconButton(
                  icon: const Icon(Icons.person_outline),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}