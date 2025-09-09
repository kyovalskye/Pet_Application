import 'package:flutter/material.dart';

class AnimalDetailPage extends StatelessWidget {
  final String name;
  final String location;
  final String age;
  final String gender;
  final String image;

  const AnimalDetailPage({
    super.key,
    required this.name,
    required this.location,
    required this.age,
    required this.gender,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Foto
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(location, style: const TextStyle(color: Colors.grey)),
              // dst...
            ],
          ),
        ),
      ),
    );
  }
}
