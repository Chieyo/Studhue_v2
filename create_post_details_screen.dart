import 'package:flutter/material.dart';

enum PostType { regular, product }

class CreatePostDetailsScreen extends StatefulWidget {
  const CreatePostDetailsScreen({super.key});

  @override
  State<CreatePostDetailsScreen> createState() =>
      _CreatePostDetailsScreenState();
}

class _CreatePostDetailsScreenState extends State<CreatePostDetailsScreen> {
  PostType _postType = PostType.regular;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Details',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // choosing post types
              const Text('Post Type:', style: TextStyle(fontSize: 16)),
              ListTile(
                title: const Text('Regular Post'),
                leading: Radio<PostType>(
                  value: PostType.regular,
                  groupValue: _postType,
                  onChanged: (PostType? value) {
                    setState(() {
                      _postType = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Product Post'),
                leading: Radio<PostType>(
                  value: PostType.product,
                  groupValue: _postType,
                  onChanged: (PostType? value) {
                    setState(() {
                      _postType = value!;
                    });
                  },
                ),
              ),

              const SizedBox(height: 16),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),

              // Show extra fields if product post
              if (_postType == PostType.product) ...[
                const SizedBox(height: 16),
                TextField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _linkController,
                  decoration: const InputDecoration(
                    labelText: 'Product Link',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],

              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final title = _titleController.text;
                    final desc = _descriptionController.text;

                    if (_postType == PostType.product) {
                      final price = _priceController.text;
                      final link = _linkController.text;

                      //product post
                      print('Product Post: $title - $price - $link');
                    } else {
                      //regular post
                      print('Regular Post: $title - $desc');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Publish',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
