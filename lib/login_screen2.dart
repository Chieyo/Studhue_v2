import 'package:flutter/material.dart';

void main() {
  runApp(const LoginScreen2());
}

class LoginScreen2 extends StatelessWidget {
  const LoginScreen2({super.key});

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
                const SizedBox(height: 50),

                // Login Box
                Container(
                  width: 357,
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                      169,
                      255,
                      255,
                      255,
                    ), // Semi-transparent background
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(95, 157, 156, 156),
                        offset: Offset(0, 4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'NirmalaUI',
                            ),
                          ),
                          SizedBox(height: 5), // Small gap between texts
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                              fontSize: 18, // Smaller font size
                              color: Colors.white,
                              fontWeight: FontWeight.normal, // Normal weight
                              fontFamily: 'NirmalaUI',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      // Email & Password Fields
                      _buildInputField('Email'),
                      const SizedBox(height: 15),
                      _buildInputField('Password', isPassword: true),

                      const SizedBox(height: 15),

                      // Forgot Password
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white70,
                            fontFamily: 'NirmalaUI',
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Sign In Button
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          // Handle login action
                          onPressed: () {Navigator.pushNamed(context, "/home");},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0792CD),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'NirmalaUI',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Back Button (Top Left)
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

  // Reusable input field widget
  Widget _buildInputField(String hint, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white70),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70, fontSize: 15),
          border: InputBorder.none,
          suffixIcon:
              isPassword
                  ? const Icon(Icons.visibility, color: Colors.white70)
                  : null,
        ),
      ),
    );
  }
}