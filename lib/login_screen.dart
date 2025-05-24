import 'package:flutter/material.dart';
import 'api_service.dart'; // Change this to your actual path

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  void _handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showDialog('Please enter both email and password');
      return;
    }

    setState(() => isLoading = true);

    try {
      final response = await ApiService.loginUser(email: email, password: password);
      // Assuming response contains a token and message
      if (response['token'] != null) {
        // Save token or do something here, e.g., Navigator to home
        _showDialog('Login successful!').then((_) {
          Navigator.pushNamed(context, '/home');
        });
      } else {
        _showDialog('Login failed: ${response['message'] ?? 'Unknown error'}');
      }
    } catch (e) {
      _showDialog('Login failed: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _showDialog(String message) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('graphics/Background.png', fit: BoxFit.cover),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('graphics/Logo C.png', width: 70),
                      const SizedBox(width: 10),
                      Image.asset('graphics/Typography.png', width: 250),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Container(
                    width: 357,
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(169, 255, 255, 255),
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
                        const Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NirmalaUI',
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Welcome Back!',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'NirmalaUI',
                          ),
                        ),
                        const SizedBox(height: 25),

                        // Email field
                        _buildInputField('Email', emailController),

                        const SizedBox(height: 15),

                        // Password field
                        _buildInputField('Password', passwordController, isPassword: true),

                        const SizedBox(height: 15),

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

                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: isLoading ? null : _handleLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0792CD),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: isLoading
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Text(
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
          ),
          Positioned(
            top: 21,
            left: 20,
            child: IconButton(
              icon: Image.asset('graphics/back_button.png', width: 29, height: 29),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String hint, TextEditingController controller,
      {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white70),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70, fontSize: 15),
          border: InputBorder.none,
          suffixIcon: isPassword ? const Icon(Icons.visibility, color: Colors.white70) : null,
        ),
      ),
    );
  }
}
