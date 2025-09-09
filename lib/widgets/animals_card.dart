import 'package:flutter/material.dart';
import 'package:pet_application_flutter/pages/animal_detail_pages.dart';

class AnimalsCard extends StatelessWidget {
  const AnimalsCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy
    final animals = [
      {
        "name": "Rigby The Cat",
        "location": "Texas, US",
        "age": "1 year",
        "gender": "Female",
        "image": "assets/images/rigby.jpg",
      },
      {
        "name": "Doggo",
        "location": "NY, US",
        "age": "2 years",
        "gender": "Male",
        "image": "assets/images/doggo.png",
      },
      // tambah data lain...
    ];

    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: animals.length,
        itemBuilder: (context, index) {
          final animal = animals[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimalDetailPage(
                    name: animal["name"]!,
                    location: animal["location"]!,
                    age: animal["age"]!,
                    gender: animal["gender"]!,
                    image: animal["image"]!,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(animal["image"]!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
