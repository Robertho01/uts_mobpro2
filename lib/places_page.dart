import 'package:flutter/material.dart';

class PlacesPage extends StatefulWidget {
  final String cityName;

  const PlacesPage({super.key, required this.cityName});

  @override
  _PlacesPageState createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  final TextEditingController _searchController = TextEditingController();

  // Data tempat yang terkait dengan genre
  final List<Map<String, String>> _places = [
    {
      'name': 'Blues Artist 1',
      'genre': 'Blues',
      'description': 'Genre musik yang penuh dengan emosi dan soul.'
    },
    {
      'name': 'Blues Artist 2',
      'genre': 'Blues',
      'description': 'Genre musik yang penuh dengan emosi dan soul.'
    },
    {
      'name': 'Blues Artist 3',
      'genre': 'Blues',
      'description': 'Genre musik yang penuh dengan emosi dan soul.'
    },
    {
      'name': 'Blues Artist 4',
      'genre': 'Blues',
      'description': 'Genre musik yang penuh dengan emosi dan soul.'
    },
    {
      'name': 'Blues Artist 5',
      'genre': 'Blues',
      'description': 'Genre musik yang penuh dengan emosi dan soul.'
    },
    {
      'name': 'Classical Artist 1',
      'genre': 'Classical',
      'description': 'Musik klasik dengan orkestra dan komposisi indah.'
    },
    {
      'name': 'Classical Artist 2',
      'genre': 'Classical',
      'description': 'Musik klasik dengan orkestra dan komposisi indah.'
    },
    {
      'name': 'Classical Artist 3',
      'genre': 'Classical',
      'description': 'Musik klasik dengan orkestra dan komposisi indah.'
    },
    {
      'name': 'Classical Artist 4',
      'genre': 'Classical',
      'description': 'Musik klasik dengan orkestra dan komposisi indah.'
    },
    {
      'name': 'Classical Artist 5',
      'genre': 'Classical',
      'description': 'Musik klasik dengan orkestra dan komposisi indah.'
    },
    {
      'name': 'Electronic Artist 1',
      'genre': 'Electronic',
      'description': 'Musik modern dengan sentuhan teknologi.'
    },
    {
      'name': 'Electronic Artist 2',
      'genre': 'Electronic',
      'description': 'Musik modern dengan sentuhan teknologi.'
    },
    {
      'name': 'Electronic Artist 3',
      'genre': 'Electronic',
      'description': 'Musik modern dengan sentuhan teknologi.'
    },
    {
      'name': 'Electronic Artist 4',
      'genre': 'Electronic',
      'description': 'Musik modern dengan sentuhan teknologi.'
    },
    {
      'name': 'Electronic Artist 5',
      'genre': 'Electronic',
      'description': 'Musik modern dengan sentuhan teknologi.'
    },
    {
      'name': 'HipHop Artist 1',
      'genre': 'HipHop',
      'description': 'Genre dengan ritme cepat dan lirik kuat.'
    },
    {
      'name': 'HipHop Artist 2',
      'genre': 'HipHop',
      'description': 'Genre dengan ritme cepat dan lirik kuat.'
    },
    {
      'name': 'HipHop Artist 3',
      'genre': 'HipHop',
      'description': 'Genre dengan ritme cepat dan lirik kuat.'
    },
    {
      'name': 'HipHop Artist 4',
      'genre': 'HipHop',
      'description': 'Genre dengan ritme cepat dan lirik kuat.'
    },
    {
      'name': 'HipHop Artist 5',
      'genre': 'HipHop',
      'description': 'Genre dengan ritme cepat dan lirik kuat.'
    },
    {
      'name': 'Jazz Artist 1',
      'genre': 'Jazz',
      'description': 'Musik improvisasi dengan melodi yang khas.'
    },
    {
      'name': 'Jazz Artist 2',
      'genre': 'Jazz',
      'description': 'Musik improvisasi dengan melodi yang khas.'
    },
    {
      'name': 'Jazz Artist 3',
      'genre': 'Jazz',
      'description': 'Musik improvisasi dengan melodi yang khas.'
    },
    {
      'name': 'Jazz Artist 4',
      'genre': 'Jazz',
      'description': 'Musik improvisasi dengan melodi yang khas.'
    },
    {
      'name': 'Jazz Artist 5',
      'genre': 'Jazz',
      'description': 'Musik improvisasi dengan melodi yang khas.'
    },
    {
      'name': 'Pop Artist 1',
      'genre': 'Pop',
      'description': 'Genre musik populer yang mudah diingat.'
    },
    {
      'name': 'Pop Artist 2',
      'genre': 'Pop',
      'description': 'Genre musik populer yang mudah diingat.'
    },
    {
      'name': 'Pop Artist 3',
      'genre': 'Pop',
      'description': 'Genre musik populer yang mudah diingat.'
    },
    {
      'name': 'Pop Artist 4',
      'genre': 'Pop',
      'description': 'Genre musik populer yang mudah diingat.'
    },
    {
      'name': 'Pop Artist 5',
      'genre': 'Pop',
      'description': 'Genre musik populer yang mudah diingat.'
    },
    {
      'name': 'Reggae Artist 1',
      'genre': 'Reggae',
      'description': 'Musik santai dengan ritme khas dari Jamaika.'
    },
    {
      'name': 'Reggae Artist 2',
      'genre': 'Reggae',
      'description': 'Musik santai dengan ritme khas dari Jamaika.'
    },
    {
      'name': 'Reggae Artist 3',
      'genre': 'Reggae',
      'description': 'Musik santai dengan ritme khas dari Jamaika.'
    },
    {
      'name': 'Reggae Artist 4',
      'genre': 'Reggae',
      'description': 'Musik santai dengan ritme khas dari Jamaika.'
    },
    {
      'name': 'Reggae Artist 5',
      'genre': 'Reggae',
      'description': 'Musik santai dengan ritme khas dari Jamaika.'
    },
    {
      'name': 'Reggae Artist 1',
      'genre': 'Reggae',
      'description': 'Musik santai dengan ritme khas dari Jamaika.'
    },
    {
      'name': 'Rock Artist 1',
      'genre': 'Rock',
      'description': 'Genre musik dengan gitar listrik dan energi tinggi.'
    },
    {
      'name': 'Rock Artist 2',
      'genre': 'Rock',
      'description': 'Genre musik dengan gitar listrik dan energi tinggi.'
    },
    {
      'name': 'Rock Artist 3',
      'genre': 'Rock',
      'description': 'Genre musik dengan gitar listrik dan energi tinggi.'
    },
    {
      'name': 'Rock Artist 4',
      'genre': 'Rock',
      'description': 'Genre musik dengan gitar listrik dan energi tinggi.'
    },
    {
      'name': 'Rock Artist 5',
      'genre': 'Rock',
      'description': 'Genre musik dengan gitar listrik dan energi tinggi.'
    },
  ];

  List<Map<String, String>> _filteredPlaces = [];

  @override
  void initState() {
    super.initState();
    _filterPlaces(''); // Initially no search filter
  }

  void _filterPlaces(String query) {
    setState(() {
      _filteredPlaces = _places
          .where((place) =>
              place['genre'] == widget.cityName &&
              place['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tempat untuk Genre ${widget.cityName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search field for filtering artist names
            TextField(
              controller: _searchController,
              onChanged: _filterPlaces,
              decoration: const InputDecoration(
                labelText: 'Cari Artis Musik',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredPlaces.length,
                itemBuilder: (context, index) {
                  final place = _filteredPlaces[index];
                  return ListTile(
                    title: Text(place['name']!),
                    subtitle: Text(place['description']!),
                    leading: const Icon(Icons.music_note),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
