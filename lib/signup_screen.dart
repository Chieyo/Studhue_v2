import 'package:flutter/material.dart';
import 'api_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final ageController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final categoryController = TextEditingController();

  bool isLoading = false;

  void _handleSignUp() async {
    final email = emailController.text.trim();
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || username.isEmpty || password.isEmpty) {
      _showDialog('All fields are required');
      return;
    }

    setState(() => isLoading = true);

    try {
      final result = await ApiService.registerUser(
        email: email,
        username: username,
        password: password,
      );
      _showDialog('Signup success: ${result['message'] ?? 'Account created!'}');
    } catch (e) {
      _showDialog('Signup failed: ${e.toString()}');
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
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
                  const SizedBox(height: 40),
                  Container(
                    width: 357,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(148, 255, 255, 255),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Column(
                      children: [
                        _buildInputField('Email', emailController),
                        const SizedBox(height: 15),
                        _buildInputField('Phone Number', phoneNumberController),
                        const SizedBox(height: 15),
                        _buildInputField('Full Name', fullNameController),
                        const SizedBox(height: 15),
                        _buildInputField('Username', usernameController),
                        const SizedBox(height: 15),
                        _buildInputField('Age', ageController),
                        const SizedBox(height: 15),
                        _buildInputField('Password', passwordController, isPassword: true),
                        const SizedBox(height: 15),
                        _buildInputField('Address', addressController),
                        const SizedBox(height: 15),
                        _buildInputField('Category', categoryController),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 309,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _handleSignUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffea1a7f),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
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
          ),
          Positioned(
            top: 21,
            left: 20,
            child: IconButton(
              icon: Image.asset('graphics/back_button.png', width: 29, height: 29),
              onPressed: () => Navigator.pushNamed(context, "/login"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String hint, TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      ),
    );
  }
}
