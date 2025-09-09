import 'package:flutter/material.dart';
import 'package:pet_application_flutter/pages/animal_detail_pages.dart';

class AnimalsCard extends StatelessWidget {
  final String selectedCategory;
  final String searchQuery;

  const AnimalsCard({
    super.key,
    required this.selectedCategory,
    this.searchQuery = "",
  });

  @override
  Widget build(BuildContext context) {
    final animals = [
      {
        "name": "Rigby The Cat",
        "location": "Austin, US",
        "age": "6 months",
        "gender": "Female",
        "image": "assets/images/rigby.jpg",
        "category": "Cat",
        "description":
            "Rigby adalah kucing kecil yang lincah di Austin, suka mengejar mainan bulu dan tidur di sofa yang hangat. Usianya yang muda membuatnya penuh energi dan ingin tahu!",
      },
      {
        "name": "Doggo",
        "location": "Sydney, AU",
        "age": "3 years",
        "gender": "Male",
        "image": "assets/images/doggo.png",
        "category": "Dog",
        "description":
            "Doggo adalah anjing Golden Retriever dari Sydney yang suka berenang di pantai Bondi. Di usia 3 tahun, dia sudah jadi sahabat setia yang selalu ceria.",
      },
      {
        "name": "Faded Cat",
        "location": "Tokyo, JP",
        "age": "1.5 years",
        "gender": "Male",
        "image": "assets/images/fadedcat.png",
        "category": "Cat",
        "description":
            "Faded Cat, kucing dari Tokyo, suka duduk di balkon sambil menikmati pemandangan kota yang sibuk. Di usianya yang masih muda, dia suka mengejar bayangan lampu.",
      },
      {
        "name": "Owlie",
        "location": "London, UK",
        "age": "4 years",
        "gender": "Female",
        "image": "assets/images/wet_owl.jpg",
        "category": "Owl",
        "description":
            "Owlie, burung hantu berusia 4 tahun dari London, suka bertengger di taman-taman tua kota. Matanya yang besar selalu memikat, terutama saat malam berkabut.",
      },
      {
        "name": "Kaori",
        "location": "Jakarta, ID",
        "age": "1 year",
        "gender": "Male",
        "image": "assets/images/gecko.jpg",
        "category": "Reptile",
        "description":
            "Kaori adalah tokoh muda dari Jakarta yang suka bersembunyi di antara tanaman tropis. Di usia 1 tahun, dia senang menjelajahi terrariumnya dengan lincah.",
      },
      {
        "name": "Emiliano",
        "location": "Rome, IT",
        "age": "2.5 years",
        "gender": "Male",
        "image": "assets/images/catnoears.jpg",
        "category": "Cat",
        "description":
            "Emiliano, kucing berusia 2,5 tahun dari Roma, suka berjalan di gang-gang tua kota. Tanpa telinga, dia tetap menawan dan suka mencuri perhatian turis!",
      },
      {
        "name": "Rubert",
        "location": "Vancouver, CA",
        "age": "3.5 years",
        "gender": "Male",
        "image": "assets/images/smilingowl.jpg",
        "category": "Owl",
        "description":
            "Rubert adalah burung hantu berusia 3,5 tahun dari Vancouver yang suka terbang di hutan cedar. Senyumnya yang khas membuatnya disukai oleh pecinta burung.",
      },
      {
        "name": "Juan",
        "location": "Sao Paulo, BR",
        "age": "8 months",
        "gender": "Male",
        "image": "assets/images/rabbit.jpg",
        "category": "Rabbit",
        "description":
            "Juan, kelinci kecil berusia 8 bulan dari Sao Paulo, suka melompat di taman kota. Dia gemar mengunyah sayuran segar dan selalu penasaran dengan lingkungannya.",
      },
      {
        "name": "Bonny",
        "location": "Cape Town, ZA",
        "age": "2 years",
        "gender": "Female",
        "image": "assets/images/grassrabbit.jpg",
        "category": "Rabbit",
        "description":
            "Bonny, kelinci berusia 2 tahun dari Cape Town, suka bersantai di padang rumput dekat Table Mountain. Dia lembut dan suka dipeluk oleh anak-anak.",
      },
      {
        "name": "Max",
        "location": "Bali, ID",
        "age": "5 years",
        "gender": "Male",
        "image": "assets/images/dognormal.jpg",
        "category": "Dog",
        "description":
            "Max, anjing berusia 5 tahun dari Bali, adalah petualang sejati yang suka berlari di pantai Kuta. Bulunya yang berkilau mencerminkan semangatnya yang bebas.",
      },
    ];

    // Filter berdasarkan kategori dan search query
    final filteredAnimals = animals.where((animal) {
      final matchesCategory =
          selectedCategory == "All" || animal["category"] == selectedCategory;
      final matchesSearch =
          searchQuery.isEmpty ||
          animal["name"]!.toLowerCase().contains(searchQuery);
      return matchesCategory && matchesSearch;
    }).toList();

    // Tampilkan pesan jika tidak ada hewan yang ditemukan
    if (filteredAnimals.isEmpty) {
      return Container(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
              const SizedBox(height: 16),
              Text(
                searchQuery.isNotEmpty
                    ? 'No pets found for "$searchQuery"'
                    : 'No pets found in this category',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Try searching with different keywords',
                style: TextStyle(fontSize: 14, color: Colors.grey[500]),
              ),
            ],
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemCount: filteredAnimals.length,
      itemBuilder: (context, index) {
        final animal = filteredAnimals[index];
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
                  description: animal["description"]!,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          image: AssetImage(animal["image"]!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            animal["name"]!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 12,
                                color: Colors.grey[500],
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  animal["location"]!,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey[600],
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  animal["age"]!,
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.blue[700],
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Icon(
                                animal["gender"] == "Male"
                                    ? Icons.male
                                    : Icons.female,
                                color: animal["gender"] == "Male"
                                    ? Colors.blue[400]
                                    : Colors.pink[400],
                                size: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
