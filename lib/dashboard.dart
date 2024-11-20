import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'places_page.dart';

class DashboardPage extends StatefulWidget {
  final String username;

  const DashboardPage({super.key, required this.username});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> _cities = [
    {'name': 'Blues', 'image': 'assets/images/blues.jpg'},
    {'name': 'Classical', 'image': 'assets/images/classical.jpg'},
    {'name': 'Electronic', 'image': 'assets/images/electronic.jpg'},
    {'name': 'HipHop', 'image': 'assets/images/hiphop.jpg'},
    {'name': 'Jazz', 'image': 'assets/images/jazz.jpg'},
    {'name': 'Pop', 'image': 'assets/images/pop.jpg'},
    {'name': 'Reggae', 'image': 'assets/images/reggae.jpg'},
    {'name': 'Rock', 'image': 'assets/images/rock.jpg'},
  ];

  List<Map<String, String>> _filteredCities = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _filteredCities = _cities; // Initialize with all cities
  }

  void _filterCities(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredCities = _cities;
      } else {
        _filteredCities = _cities
            .where((city) =>
                city['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomePage(context),
      _buildProfilePage(context),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        backgroundColor: Colors.blueAccent,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        height: 60,
        items: const [
          Icon(Icons.home, size: 30, color: Colors.blue),
          Icon(Icons.person, size: 30, color: Colors.blue),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildHomePage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selamat datang, ${widget.username}!',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _searchController,
            onChanged: _filterCities,
            decoration: const InputDecoration(
              labelText: 'Cari Genre',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 3 / 4,
              ),
              itemCount: _filteredCities.length,
              itemBuilder: (context, index) {
                final city = _filteredCities[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PlacesPage(cityName: city['name']!),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            child: Image.asset(
                              city['image']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            city['name']!,
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePage(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/saya.jpg', // Pastikan nama file sesuai
              width: 100, // Ukuran lebar foto
              height: 100, // Ukuran tinggi foto
              fit: BoxFit.cover, // Crop gambar untuk mengisi lingkaran
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Profil ${widget.username}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Email : tekegebesar88933@gmail.com',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
