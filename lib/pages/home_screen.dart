import 'package:flutter/material.dart';
import 'package:pet_application_flutter/widgets/animals_card.dart';
import 'package:pet_application_flutter/widgets/categories_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search
              const SearchBar(),
              const SizedBox(height: 20),

              // Categories title
              const Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const CategoriesList(),
              const SizedBox(height: 20),

              // Latest Pets title
              const Text(
                "Latest Pets",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Grid
              const Expanded(child: AnimalsCard()),
            ],
          ),
        ),
      ),
    );
  }
}
