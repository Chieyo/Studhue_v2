import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Art Social App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ArtVault(),
    );
  }
}

class ArtVault extends StatefulWidget {
  const ArtVault({super.key});

  @override
  ArtVaultState createState() => ArtVaultState();
}

class ArtVaultState extends State<ArtVault> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const TopBar(),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCart(
              username: 'Baching',
              productname: 'Crochet Bag',
              variation: 'small',
              quantity: quantity,
              price: 150.00,
              iconPath: 'graphics/icons/icon2.jpg',
              imagePath: 'graphics/products/product1.jpg',
              onQuantityChanged: (newQuantity) {
                setState(() {
                  quantity = newQuantity;
                });
              },
            ),
            _buildCart(
              username: 'Haizzle',
              productname: 'Clay Hippers',
              variation: 'small',
              quantity: quantity,
              price: 100.00,
              iconPath: 'graphics/icons/icon3.jpg',
              imagePath: 'graphics/products/product2.jpg',
              onQuantityChanged: (newQuantity) {
                setState(() {
                  quantity = newQuantity;
                });
              },
            ),
            _buildCart(
              username: 'Papricart',
              productname: 'Keychains',
              variation: 'Calcifier',
              quantity: quantity,
              price: 85.00,
              iconPath: 'graphics/icons/icon4.jpg',
              imagePath: 'graphics/products/product3.jpg',
              onQuantityChanged: (newQuantity) {
                setState(() {
                  quantity = newQuantity;
                });
              },
            ),
            _buildCart(
              username: 'Fufi',
              productname: 'Resin Coaster',
              variation: 'Bunny-Medium',
              quantity: quantity,
              price: 150.00,
              iconPath: 'graphics/icons/icon5.jpg',
              imagePath: 'graphics/products/product4.jpg',
              onQuantityChanged: (newQuantity) {
                setState(() {
                  quantity = newQuantity;
                });
              },
            ),
            _buildCart(
              username: 'Zeon',
              productname: 'Simple Vase',
              variation: 'small',
              quantity: quantity,
              price: 175.00,
              iconPath: 'graphics/icons/icon6.jpg',
              imagePath: 'graphics/products/product5.jpg',
              onQuantityChanged: (newQuantity) {
                setState(() {
                  quantity = newQuantity;
                });
              },
            ),
            _buildCart(
              username: 'Rizzle',
              productname: 'Bunbun Stickers',
              variation: 'Pack-A',
              quantity: quantity,
              price: 100.00,
              iconPath: 'graphics/icons/icon7.jpg',
              imagePath: 'graphics/products/product6.jpg',
              onQuantityChanged: (newQuantity) {
                setState(() {
                  quantity = newQuantity;
                });
              },
            ),
            _buildCart(
              username: 'MeiMei',
              productname: 'Butterfly Painting',
              variation: '10x10',
              quantity: quantity,
              price: 250.00,
              iconPath: 'graphics/icons/icon10.jpg',
              imagePath: 'graphics/products/product7.jpg',
              onQuantityChanged: (newQuantity) {
                setState(() {
                  quantity = newQuantity;
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: double.infinity,
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
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
                onPressed: () {
                  Navigator.pushNamed(context, "/vault");
                },
              ),
              IconButton(
                icon: const Icon(Icons.person_outline),
                onPressed: () {
                  Navigator.pushNamed(context, "/profile");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildCart({
  required String username,
  required String productname,
  required String variation,
  required int quantity,
  required double price,
  required String iconPath,
  required String imagePath,
  required ValueChanged<int> onQuantityChanged,
}) {
  return Container(
    color: Colors.white,
    child: SizedBox(
      width: 393,
      height: 132,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
              width: 393,
              height: 42,
              child: Row(
                children: [
                  const SizedBox(width: 15),
                  CircleAvatar(
                    radius: 13,
                    backgroundImage: AssetImage(iconPath),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    username,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xff30343d),
                      fontFamily: 'Inter-Regular',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(Icons.arrow_forward_ios_rounded,
                      size: 14, color: Color(0xffea1a7f)),
                ],
              ),
            ),
          ),
          Positioned(
            left: 6.999,
            width: 380,
            top: 42.492,
            height: 1,
            child: Container(
              width: 380,
              height: 1,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffea1a7f), width: 2),
              ),
            ),
          ),
          Positioned(
            left: 0,
            width: 393,
            top: 46,
            height: 80,
            child: Stack(
              children: [
                Container(
                  width: 393,
                  height: 80,
                  color: const Color(0xfffffdfd),
                ),
                Positioned(
                  left: 23,
                  top: 32,
                  child: Container(
                    width: 17,
                    height: 17,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffbdbec0), width: 1),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Positioned(
                  left: 53,
                  top: 7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      imagePath,
                      width: 65,
                      height: 66.182,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 131,
                  top: 9,
                  child: Text(
                    productname,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff7d7e7f),
                      fontFamily: 'Inter-Regular',
                    ),
                  ),
                ),
                Positioned(
                  left: 294,
                  top: 49,
                  child: Text(
                    '₱${price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xffea1a7f),
                      fontFamily: 'Inter-Bold',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                QuantitySelector(
                  quantity: quantity,
                  onQuantityChanged: onQuantityChanged,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 131,
      top: 30,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffd9d9d9), width: 1.5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                if (quantity > 1) {
                  onQuantityChanged(quantity - 1);
                }
              },
              child: const SizedBox(
                width: 17,
                height: 17,
                child: Icon(Icons.remove, size: 14),
              ),
            ),
            Container(
              width: 17,
              height: 17,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffd9d9d9), width: 1),
              ),
              child: Text(
                quantity.toString(),
                style: const TextStyle(fontSize: 10),
              ),
            ),
            GestureDetector(
              onTap: () {
                onQuantityChanged(quantity + 1);
              },
              child: const SizedBox(
                width: 17,
                height: 17,
                child: Icon(Icons.add, size: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff14c1e1),
      child: SizedBox(
        width: double.infinity,
        height: 76,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              width: double.infinity,
              top: 0,
              height: 76,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff14c1e1),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 15,
                      left: 0,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_rounded, size: 30),
                        onPressed: () {
                          Navigator.pushNamed(context, "/homescreen");
                        },
                      ),
                    ),
                    const Positioned(
                      left: 39,
                      top: 27,
                      child: Text(
                        'Art Vault',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff000000),
                          fontFamily: 'Inter-Bold',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 330,
                      top: 30,
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff000000),
                          fontFamily: 'Inter-Regular',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
