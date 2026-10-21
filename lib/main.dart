import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ==================== MODEL DATA ====================

class Pet {
  final String name;
  final String type;
  final int age;
  final bool indoor;

  const Pet({
    required this.name,
    required this.type,
    required this.age,
    required this.indoor,
  });
}

// Object data milik sendiri
const Pet myPet = Pet(
  name: 'Mochi',
  type: 'Kelinci',
  age: 2,
  indoor: true,
);

// ==================== MY APP ====================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pawly',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF7FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE98BA8),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFDCE7),
          foregroundColor: Color(0xFF573B45),
        ),
      ),
      home: const HomePage(),
    );
  }
}

// ==================== HOME PAGE ====================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🐾 Pawly',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ==================== HEADER ====================

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE98BA8),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.pets,
                      color: Colors.white,
                      size: 42,
                    ),

                    SizedBox(height: 12),

                    Text(
                      'Hello, Pet Parent! 🎀',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 6),

                    Text(
                      'Jangan lupa rawat teman kecilmu hari ini!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ==================== PET PROFILE ====================

              const Text(
                'My Pet',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF573B45),
                ),
              ),

              const SizedBox(height: 12),

              PetCard(pet: myPet),

              const SizedBox(height: 25),

              // ==================== TODAY'S CARE ====================

              const Text(
                "Today's Care ✨",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF573B45),
                ),
              ),

              const SizedBox(height: 12),

              CareCard(
                icon: Icons.restaurant,
                title: 'Beri makan',
                subtitle: 'Jadwal: Pagi & Sore',
              ),

              const SizedBox(height: 10),

              CareCard(
                icon: Icons.water_drop,
                title: 'Ganti air minum',
                subtitle: 'Jadwal: Setiap hari',
              ),

              const SizedBox(height: 10),

              CareCard(
                icon: Icons.cleaning_services,
                title: 'Bersihkan kandang',
                subtitle: 'Jadwal: 2x seminggu',
              ),

              const SizedBox(height: 22),

              // ==================== BUTTON ====================

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          '🎀 Perawatan selesai! Good job, pet parent! 🐾',
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.check_circle),
                  label: const Text(
                    'Sudah Dilakukan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE98BA8),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ==================== WATERMARK ====================

              Center(
                child: Text(
                  '202432034_ZuliaAnnisa',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== CUSTOM PET CARD ====================

class PetCard extends StatelessWidget {
  final Pet pet;

  const PetCard({
    super.key,
    required this.pet,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [

            // Icon hewan
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xFFFFE8EF),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Icon(
                Icons.cruelty_free,
                size: 42,
                color: Color(0xFFE98BA8),
              ),
            ),

            const SizedBox(width: 16),

            // Informasi hewan
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pet.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF573B45),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    '${pet.type} • ${pet.age} tahun',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      Icon(
                        pet.indoor
                            ? Icons.home
                            : Icons.wb_sunny,
                        size: 17,
                        color: const Color(0xFFE98BA8),
                      ),

                      const SizedBox(width: 5),

                      Text(
                        pet.indoor
                            ? 'Indoor Pet'
                            : 'Outdoor Pet',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== CUSTOM CARE CARD ====================

class CareCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const CareCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [

            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFFFE8EF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                color: const Color(0xFFE98BA8),
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF573B45),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.chevron_right,
              color: Color(0xFFE98BA8),
            ),
          ],
        ),
      ),
    );
  }
}