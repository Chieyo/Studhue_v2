import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';


//Post
  class Post {
  final String username;
  final String profession;
  final bool isVerified;
  final String postImagePath;
  final String iconPath;

  Post({
    required this.username,
    required this.profession,
    required this.isVerified,
    required this.postImagePath,
    required this.iconPath,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      username: json['username'],
      profession: json['profession'],
      isVerified: json['isVerified'] ?? false,
      postImagePath: json['postImagePath'],
      iconPath: json['iconPath'],
    );
  }
}

class ApiService {
  static const String baseUrl = 'http://192.168.0.111:3000/api';

  static final _logger = Logger('ApiService');

  // Initialize logging — call this once, e.g. in main()
  static void setupLogging() {
    Logger.root.level = Level.ALL; // Capture all logs
    Logger.root.onRecord.listen((record) {
      // Customize this if you want to write logs to a file or remote server
      print('${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
    });
  }

  // LOGIN
  static Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/users/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      _logger.info('User logged in successfully.');
      return jsonDecode(response.body);
    } else {
      _logger.severe('Failed to login: ${response.body}');
      throw Exception('Failed to login: ${response.body}');
    }
  }

  // SIGN UP
  static Future<Map<String, dynamic>> registerUser({
    required String username,
    required String password,
    required String email,
  }) async {
    final url = Uri.parse('$baseUrl/users/signup');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
        'email': email,
      }),
    );

    if (response.statusCode == 201) {
      _logger.info('User registered successfully.');
      return jsonDecode(response.body);
    } else {
      _logger.severe('Signup failed: ${response.body}');
      throw Exception('Signup failed: ${response.body}');
    }
  }

  // Fetch user profile
  static Future<Map<String, dynamic>?> fetchProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');

    if (token == null) {
      _logger.warning('JWT token not found; user might not be logged in.');
      return null;
    }

    final response = await http.get(
      Uri.parse('$baseUrl/profile'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      _logger.info('Fetched profile data successfully.');
      return jsonDecode(response.body);
    } else {
      _logger.warning('Failed to fetch profile: ${response.body}');
      return null;
    }
  }

  // Fetch posts for logged in user
  static Future<List<Post>> fetchPosts() async {
    // If you need JWT token:
    // final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('jwt_token');

    final response = await http.get(
      Uri.parse('$baseUrl/posts'),
      // headers: {
      //   'Authorization': 'Bearer $token',
      //   'Content-Type': 'application/json',
      // },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch posts');
    }
  }
}

