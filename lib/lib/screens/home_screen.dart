import 'package:flutter/material.dart';
import '../models/app_item.dart';
import '../widgets/app_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  final List<AppItem> _allApps = [
    AppItem(
      name: 'My Game 1',
      description: 'Моя первая игра',
      iconUrl: 'https://via.placeholder.com/150',
      owner: 'your_github_username',
      repo: 'my_game_1',
    ),
    AppItem(
      name: 'My App 2',
      description: 'Моё второе приложение',
      iconUrl: 'https://via.placeholder.com/150',
      owner: 'your_github_username',
      repo: 'my_app_2',
    ),
    AppItem(
      name: 'My Tool 3',
      description: 'Полезный инструмент',
      iconUrl: 'https://via.placeholder.com/150',
      owner: 'your_github_username',
      repo: 'my_tool_3',
    ),
  ];

  List<AppItem> get _filteredApps {
    if (_query.isEmpty) return _allApps;
    return _allApps
        .where((app) =>
            app.name.toLowerCase().contains(_query.toLowerCase()) ||
            app.description.toLowerCase().contains(_query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play Mak'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => setState(() => _query = value),
              decoration: InputDecoration(
                hintText: 'Поиск в Play Mak',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: _filteredApps.isEmpty
                ? const Center(child: Text('Ничего не найдено'))
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: _filteredApps.length,
                    itemBuilder: (context, index) {
                      return AppCard(app: _filteredApps[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
