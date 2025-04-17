import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Masjid Gede Mataram';
    return MaterialApp(
      title: appTitle, 
      home: Scaffold(
        // Widget Scaffold menyediakan struktur dasar aplikasi.
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true, 
          elevation: 6, 
          title: const Text(
            appTitle,
            style: TextStyle(
              // memberikan style pada tittle.
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),

          // menambahkan icon arrow_back pada sisi kiri appbar.
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {

            },
            color: Colors.white,
          ),
        ),
        // Bagian utama aplikasi yang beisi konten dari aplikasi tersebut.
        body: const SingleChildScrollView(
          child: Column(
            children: [
              // menampilkan gambar.
              ImageSection(image: 'images/masjid.jpg'),

              // menampilkan nama dan lokasi.
              TitleSection(
                name: 'Masjid Gedhe Mataram',
                location: 'Kotagede,D.I Yogyakarta',
              ),

              ButtonSection(),

              // Menampilkan Deskripsi.
              TextSection(
                description:
                  'Masjid Gede Mataram Kotagede terletak di Dusun Sayangan, Desa Jagalan, '
                  'Kecamatan Banguntapan, Kabupaten Bantul, Propinsi Daerah Istimewa Yogyakarta. '
                  'Masjid ini berada di dekat kompleks makam pendiri Kerajaan Mataram Islam '
                  'beserta keluarganya dan pemandian Sendang Seliran.'
                  'Tahun pembangunan masjid ini belum diketahui secara pasti. '
                  'ada dugaan masjid ini dibangun pada masa pemerintahan Sultan Agung (1613 â€“ 1645 M). '
                  'Pada tahun 1919 M masjid ini terbakar, kemudian selesai di perbaiki pada tahun 1923 M.',
              ),
            ],
          ),
        ),

        // Menambahkan tombol navigasi.
        bottomNavigationBar: const NavigationSection(),
      ),
    );
  }
}

// Menampilkan teks name dan location.
class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              // Mengatur posisi teks berada di posisi paling kiri.
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),

                  // Memberikan styling pada text name.
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),

                // Memberikan styling pada text location.
                Text(
                  location,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),

          // Memberi icon star pada teks.
          Icon(Icons.star, color: Colors.red, size: 32),
          const Text('4.5'),
        ],
      ),
    );
  }
}

//Menampilkan tombol aksi.
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(color: color, icon: Icons.call, label: 'CALL'),
          ButtonWithText(color: color, icon: Icons.near_me, label: 'ROUTE'),
          ButtonWithText(color: color, icon: Icons.share, label: 'SHARE'),
        ],
      ),
    );
  }
}

// Menampilkan tombol icon dan text.
class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 32),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

// Menampilkan teks deskripsion dengan styling yang sudah di atur.
class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true),
    );
  }
}

// Menampilkan teks deskripsion dengan styling yang sudah di atur.
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
  }
}

// Menambahkan tomboil navigasi di bawah.
class NavigationSection extends StatelessWidget {
  const NavigationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Saya'),
      ],
      selectedItemColor: color,
    );
  }
}