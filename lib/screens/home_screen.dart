import 'package:flutter/material.dart';
import '../screens/question_screen.dart'; // Import screen untuk pertanyaan

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FA),
      body: SingleChildScrollView( // Membuat halaman scrollable
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Mengubah alignment ke tengah
                children: [
                  const Center( // Membungkus teks '505' dalam Center widget
                    child: Text(
                      "505",
                      style: TextStyle(
                        fontSize: 40, // Membesarkan teks
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40), // Memberi jarak lebih besar
                  GridView(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Mengurangi jumlah kolom agar item lebih besar
                      childAspectRatio: 1, // Menjaga rasio item agar lebih persegi
                      crossAxisSpacing: 20, // Memberi lebih banyak jarak antar kolom
                      mainAxisSpacing: 20, // Memberi lebih banyak jarak antar baris
                    ),
                    children: [
                      _buildGridItem(context, 'img/mathematics.png', "Matematika"),
                      _buildGridItem(context, 'img/science.png', "Sains"),
                      _buildGridItem(context, 'img/book.png', "Bahasa"),
                      _buildGridItem(context, 'img/musical.png', "Musik"),
                      _buildGridItem(context, 'img/sport.jpg', "Olahraga"),
                      _buildGridItem(context, 'img/geo.jpg', "Geografi"),
                      _buildGridItem(context, 'img/prak.png', "Prakarya"),
                      _buildGridItem(context, 'img/agama.png', "Agama"),

                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Menambah jarak di bagian bawah
          ],
        ),
      ),
    );
  }

  // Menambahkan parameter context untuk Navigator
  Widget _buildGridItem(BuildContext context, String imagePath, String label) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman QuestionScreen sesuai dengan label
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionScreen(subject: label), // Pindah ke QuestionScreen dengan subject
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath, // Mengganti ikon dengan gambar dari asset
              width: 60, // Mengatur ukuran gambar
              height: 60,
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
