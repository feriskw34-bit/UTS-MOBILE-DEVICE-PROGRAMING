import 'package:flutter/material.dart';

void main() {
  runApp(const MusicApp());
}

// --- PALET WARNA ---
const Color appNavy = Color(0xFF0B132B); // Latar belakang utama
const Color appTeal = Color(0xFF008080); // Tombol aksi dan aksen
const Color appBeige = Color(0xFFF5F5DC); // Latar belakang kartu/elemen terang
const Color appSkyBlue = Color(0xFF87CEEB); // Ikon sekunder dan sub-teks
const Color appWhite = Color(0xFFFFFFFF); // Teks utama

class MusicApp extends StatelessWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muzica App',
      theme: ThemeData(
        scaffoldBackgroundColor: appNavy,
        fontFamily: 'Roboto', // Menggunakan font sistem yang 100% aman
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: appWhite),
          bodyMedium: TextStyle(color: appWhite),
          titleLarge: TextStyle(color: appWhite, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(color: appSkyBlue),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: appNavy,
          elevation: 0,
          iconTheme: IconThemeData(color: appWhite),
          titleTextStyle: TextStyle(
            color: appWhite,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// ==========================================
// SCREEN 1: HOME SCREEN
// ==========================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muzica'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: appSkyBlue),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Baru Saja Diputar',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: appWhite),
              ),
              const SizedBox(height: 16),
              // Horizontal Scroll View untuk Album
              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigasi ke Screen 2
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlaylistScreen(playlistIndex: index + 1),
                          ),
                        );
                      },
                      child: Container(
                        width: 120,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          color: appBeige,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.music_note,
                                size: 50, color: appNavy),
                            const SizedBox(height: 10),
                            Text(
                              'Mix ${index + 1}',
                              style: const TextStyle(
                                color: appNavy,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Rekomendasi Untukmu',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: appWhite),
              ),
              const SizedBox(height: 16),
              // Vertical List untuk Lagu
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 4),
                    leading: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: appTeal,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.album, color: appWhite),
                    ),
                    title: Text('Lagu Indie ${index + 1}',
                        style: const TextStyle(
                            color: appWhite, fontWeight: FontWeight.w600)),
                    subtitle: const Text('Artis Lokal',
                        style: TextStyle(color: appSkyBlue, fontSize: 13)),
                    trailing: const Icon(Icons.more_vert, color: appBeige),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: appNavy,
        selectedItemColor: appTeal,
        unselectedItemColor: appBeige,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        unselectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music), label: 'Koleksi'),
        ],
      ),
    );
  }
}

// ==========================================
// SCREEN 2: PLAYLIST SCREEN
// ==========================================
class PlaylistScreen extends StatelessWidget {
  final int playlistIndex;

  const PlaylistScreen({Key? key, required this.playlistIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Mix $playlistIndex'),
      ),
      body: Column(
        children: [
          // Header Playlist
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    color: appTeal,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: 15,
                          offset: Offset(0, 8))
                    ],
                  ),
                  child:
                      const Icon(Icons.queue_music, size: 80, color: appWhite),
                ),
                const SizedBox(height: 24),
                Text(
                  'Daily Mix $playlistIndex',
                  style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: appWhite),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Dibuat khusus untuk Anda',
                  style: TextStyle(
                      fontSize: 14,
                      color: appSkyBlue,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const Divider(color: appTeal, thickness: 1, height: 30),
          // Daftar Lagu
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    '${index + 1}',
                    style: const TextStyle(
                        color: appBeige,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  title: Text(
                    'Track Spesial ${index + 1}',
                    style: const TextStyle(
                        color: appWhite, fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                    'Band Favorit',
                    style: TextStyle(color: appSkyBlue, fontSize: 13),
                  ),
                  trailing: const Icon(Icons.play_circle_outline,
                      color: appTeal, size: 30),
                  onTap: () {
                    // Navigasi ke Screen 3
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayerScreen(
                          songTitle: 'Track Spesial ${index + 1}',
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// SCREEN 3: NOW PLAYING SCREEN
// ==========================================
class PlayerScreen extends StatelessWidget {
  final String songTitle;

  const PlayerScreen({Key? key, required this.songTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sedang Diputar',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.2)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: appWhite),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Album Art Besar
              Container(
                width: MediaQuery.of(context).size.width - 48,
                height: MediaQuery.of(context).size.width - 48,
                constraints: const BoxConstraints(
                  maxHeight: 320,
                  maxWidth: 320,
                ),
                decoration: BoxDecoration(
                  color: appBeige,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    )
                  ],
                ),
                child: const Icon(Icons.music_video, size: 120, color: appNavy),
              ),
              const SizedBox(height: 40),
              // Info Lagu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          songTitle,
                          style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: appWhite),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Band Favorit',
                          style: TextStyle(
                              fontSize: 18,
                              color: appSkyBlue,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.favorite_border, color: appTeal, size: 32),
                ],
              ),
              const SizedBox(height: 30),
              // Progress Bar
              SliderTheme(
                data: SliderThemeData(
                  thumbColor: appTeal,
                  activeTrackColor: appTeal,
                  inactiveTrackColor: appSkyBlue.withOpacity(0.3),
                  trackHeight: 6.0,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                ),
                child: Slider(
                  value: 0.4,
                  onChanged: (value) {},
                ),
              ),
              // Waktu
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('1:24',
                        style: TextStyle(
                            color: appBeige,
                            fontSize: 13,
                            fontWeight: FontWeight.w600)),
                    Text('3:45',
                        style: TextStyle(
                            color: appBeige,
                            fontSize: 13,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Kontrol Musik
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.shuffle, color: appSkyBlue, size: 28),
                  const Icon(Icons.skip_previous, color: appWhite, size: 42),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: appTeal,
                    ),
                    padding: const EdgeInsets.all(18),
                    child: const Icon(Icons.pause, color: appWhite, size: 42),
                  ),
                  const Icon(Icons.skip_next, color: appWhite, size: 42),
                  const Icon(Icons.repeat, color: appSkyBlue, size: 28),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
