import 'package:flutter/material.dart';

void main() {
  runApp(const SignUpScreen());
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset('graphics/Background.png', fit: BoxFit.cover),
          ),

          // Main Content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo and Typography (Side by Side)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'graphics/Logo C.png',
                      width: 70, // Adjust size as needed
                    ),
                    const SizedBox(width: 10), // Space between images
                    Image.asset(
                      'graphics/Typography.png',
                      width: 250, // Adjust width to fit nicely
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Sign-up Box
                Container(
                  width: 357,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                      148,
                      255,
                      255,
                      255,
                    ), // Semi-transparent background
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputField('Mobile Number or Email'),
                      const SizedBox(height: 15),
                      _buildInputField('Full Name'),
                      const SizedBox(height: 15),
                      _buildInputField('Username'),
                      const SizedBox(height: 15),
                      _buildInputField('Password', isPassword: true),
                      const SizedBox(height: 15),
                      _buildInputField('Category'),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Create Account Button
                SizedBox(
                  width: 309,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle sign-up action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffea1a7f),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      'CREATE AN ACCOUNT',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'IstokWeb-Bold',
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Terms & Conditions
                const SizedBox(
                  width: 306,
                  child: Text(
                    'By signing up, you agree to our Terms, Data Policy, and Cookies Policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xffd1cece),
                      fontFamily: 'IstokWeb-Regular',
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Back Button
          Positioned(
            top: 21,
            left: 20,
            child: IconButton(
              icon: Image.asset(
                'graphics/back_button.png',
                width: 29,
                height: 29,
              ),
              onPressed: ()  {Navigator.pushNamed(context, "/login");},
              // Handle back button press
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build input fields
  Widget _buildInputField(String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
      ),
    );
  }
}