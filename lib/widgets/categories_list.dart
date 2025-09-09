import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategoriesList({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"name": "All", "icon": Icons.pets, "color": Colors.purple},
      {"name": "Cat", "icon": Icons.pets, "color": Colors.orange},
      {"name": "Dog", "icon": Icons.pets, "color": Colors.brown},
      {"name": "Owl", "icon": Icons.pets, "color": Colors.teal},
      {"name": "Reptile", "icon": Icons.pets, "color": Colors.green},
      {"name": "Rabbit", "icon": Icons.pets, "color": Colors.pink},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = category["name"] == selectedCategory;
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () => onCategorySelected(category["name"]! as String),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue[600] : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: isSelected
                          ? Colors.blue.withOpacity(0.3)
                          : Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      category["icon"] as IconData,
                      color: isSelected
                          ? Colors.white
                          : category["color"] as Color,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      category["name"]! as String,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white : Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
