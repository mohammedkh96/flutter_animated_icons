import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animated Icons',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Animated Icons'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String _searchQuery = '';
  String _selectedLibrary = 'All';
  String _selectedCategory = 'All';
  bool _autoPlay = true;
  bool _isLoading = true;
  bool _showScrollToTop = false;

  Map<String, AnimationController> _controllers = {};
  Set<String> _animatingIcons = {};
  List<IconItem> _allIcons = [];

  @override
  void initState() {
    super.initState();
    _loadIconCatalog();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= 200) {
      if (!_showScrollToTop) {
        setState(() {
          _showScrollToTop = true;
        });
      }
    } else {
      if (_showScrollToTop) {
        setState(() {
          _showScrollToTop = false;
        });
      }
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _loadIconCatalog() async {
    try {
      final String jsonString = await DefaultAssetBundle.of(context)
          .loadString('assets/icon_catalog.json');
      final Map<String, dynamic> catalog = json.decode(jsonString);

      setState(() {
        _allIcons = _parseIconsFromCatalog(catalog);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading icons: $e')),
        );
      }
    }
  }

  List<IconItem> _parseIconsFromCatalog(Map<String, dynamic> catalog) {
    List<IconItem> icons = [];

    // Handle the actual JSON structure: {libraries: {library: {categories: {category: [icons]}}}}
    if (catalog.containsKey('libraries')) {
      final libraries = catalog['libraries'] as Map<String, dynamic>;
      libraries.forEach((libraryName, libraryData) {
        if (libraryData is Map<String, dynamic> &&
            libraryData.containsKey('categories')) {
          final categories = libraryData['categories'] as Map<String, dynamic>;
          categories.forEach((categoryName, iconList) {
            if (iconList is List) {
              for (var iconName in iconList) {
                if (iconName is String) {
                  icons.add(IconItem(
                    name: iconName,
                    library: libraryName,
                    category: categoryName,
                    path: _getIconPath(libraryName, iconName),
                  ));
                }
              }
            }
          });
        }
      });
    }

    return icons;
  }

  List<IconItem> get _filteredIcons {
    List<IconItem> filtered = _allIcons;

    if (_searchQuery.isNotEmpty) {
      filtered = filtered
          .where((icon) =>
              icon.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              icon.category
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()) ||
              icon.library.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }

    if (_selectedLibrary != 'All') {
      filtered =
          filtered.where((icon) => icon.library == _selectedLibrary).toList();
    }

    if (_selectedCategory != 'All') {
      filtered =
          filtered.where((icon) => icon.category == _selectedCategory).toList();
    }

    return filtered;
  }

  List<String> get _availableLibraries {
    Set<String> libraries = {'All'};
    for (var icon in _allIcons) {
      libraries.add(icon.library);
    }
    return libraries.toList()..sort();
  }

  List<String> get _availableCategories {
    Set<String> categories = {'All'};
    for (var icon in _allIcons) {
      categories.add(icon.category);
    }
    return categories.toList()..sort();
  }

  AnimationController _getController(String iconKey) {
    if (!_controllers.containsKey(iconKey)) {
      _controllers[iconKey] = AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: this,
      );
    }
    return _controllers[iconKey]!;
  }

  void _animateIcon(String iconKey) {
    final controller = _getController(iconKey);
    if (_animatingIcons.contains(iconKey)) {
      controller.stop();
      _animatingIcons.remove(iconKey);
    } else {
      controller.reset();
      controller.forward();
      _animatingIcons.add(iconKey);
    }
    setState(() {});
  }

  void _startAutoPlay() {
    if (_autoPlay && _filteredIcons.isNotEmpty) {
      _animateAllIcons();
    }
  }

  void _animateAllIcons() {
    if (!_autoPlay || !mounted || _filteredIcons.isEmpty) return;

    // Stop all current animations
    for (var iconKey in _animatingIcons.toList()) {
      _getController(iconKey).stop();
    }
    _animatingIcons.clear();

    // Animate all visible icons at once
    for (var icon in _filteredIcons) {
      final iconKey = icon.key;
      final controller = _getController(iconKey);
      controller.reset();
      controller.forward();
      _animatingIcons.add(iconKey);
    }
    setState(() {});

    // Schedule next animation cycle
    Future.delayed(const Duration(milliseconds: 3000), () {
      if (_autoPlay && mounted) {
        _animateAllIcons();
      }
    });
  }

  void _toggleAutoPlay() {
    setState(() {
      _autoPlay = !_autoPlay;
    });

    if (_autoPlay) {
      _startAutoPlay();
    } else {
      // Stop all animations and clear the animating icons list
      for (var iconKey in _animatingIcons.toList()) {
        _getController(iconKey).stop();
      }
      _animatingIcons.clear();
      setState(() {}); // Update UI to remove animation highlights
    }
  }

  void _restartAutoPlayIfActive() {
    if (_autoPlay) {
      // Stop current autoplay
      for (var iconKey in _animatingIcons.toList()) {
        _getController(iconKey).stop();
      }
      _animatingIcons.clear();
      // Restart with all filtered icons
      _animateAllIcons();
    }
  }

  String _getIconPath(String library, String iconName) {
    // Convert library name to the correct folder name
    String folderName = library.toLowerCase();
    if (folderName == 'icons8') {
      folderName = 'icons8.com';
    } else if (folderName == 'lordicon') {
      folderName = 'lordicon.com';
    } else if (folderName == 'lottiefiles') {
      folderName = 'lottiefiles.com';
    } else if (folderName == 'lottieflow') {
      folderName = 'lottieflow.com';
    } else if (folderName == 'useanimations') {
      folderName = 'useanimations.com';
    }

    // Add .json extension if not present
    String fileName = iconName;
    if (!fileName.endsWith('.json')) {
      fileName = '$iconName.json';
    }

    return 'packages/flutter_icons_animated/assets/$folderName/$fileName';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
            _restartAutoPlayIfActive();
          },
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search icons...',
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.7)),
            suffixIcon: _searchQuery.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear, color: Colors.white.withOpacity(0.7)),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _searchQuery = '';
                      });
                      _restartAutoPlayIfActive();
                    },
                  )
                : null,
          ),
        ),
        actions: [
          if (_autoPlay)
            Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'AUTO',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          IconButton(
            onPressed: _toggleAutoPlay,
            icon: Icon(_autoPlay ? Icons.pause : Icons.play_arrow),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    // Filter Chips
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Library Filter
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Library:'),
                                const SizedBox(height: 4),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: _availableLibraries.map((library) {
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: FilterChip(
                                          label: Text(library),
                                          selected: library == _selectedLibrary,
                                          onSelected: (selected) {
                                            setState(() {
                                              _selectedLibrary = library;
                                            });
                                            _restartAutoPlayIfActive();
                                          },
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // Category Filter
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Category:'),
                                const SizedBox(height: 4),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: _availableCategories.map((category) {
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: FilterChip(
                                          label: Text(category),
                                          selected: category == _selectedCategory,
                                          onSelected: (selected) {
                                            setState(() {
                                              _selectedCategory = category;
                                            });
                                            _restartAutoPlayIfActive();
                                          },
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // Stats
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Total: ${_allIcons.length}'),
                                Text('Filtered: ${_filteredIcons.length}'),
                                Text('Libraries: ${_availableLibraries.length}'),
                                Text('Categories: ${_availableCategories.length}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Icon Grid
                    _filteredIcons.isEmpty
                        ? const SliverToBoxAdapter(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(32.0),
                                child: Text(
                                    'No icons found. Try adjusting your search or filters.'),
                              ),
                            ),
                          )
                        : SliverPadding(
                            padding: const EdgeInsets.all(16),
                            sliver: SliverGrid(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.8,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  final icon = _filteredIcons[index];
                                  return _buildIconCard(icon);
                                },
                                childCount: _filteredIcons.length,
                              ),
                            ),
                          ),
                  ],
                ),
                // Floating Scroll to Top Button
                if (_showScrollToTop)
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: FloatingActionButton(
                      onPressed: _scrollToTop,
                      mini: true,
                      backgroundColor: Colors.blue,
                      child: const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
    );
  }

  Widget _buildIconCard(IconItem icon) {
    final iconKey = icon.key;
    final isAnimating = _animatingIcons.contains(iconKey);

    return Card(
      child: InkWell(
        onTap: () => _animateIcon(iconKey),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon Animation
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isAnimating
                        ? Colors.blue.withOpacity(0.2)
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    border: isAnimating
                        ? Border.all(color: Colors.blue, width: 2)
                        : null,
                    boxShadow: isAnimating
                        ? [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ]
                        : null,
                  ),
                  child: Center(
                    child: Lottie.asset(
                      icon.path,
                      controller: _getController(iconKey),
                      width: isAnimating ? 60 : 50,
                      height: isAnimating ? 60 : 50,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error_outline,
                            color: Colors.grey);
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Icon Info
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      icon.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      icon.library,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.blue[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      icon.category,
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconItem {
  final String name;
  final String library;
  final String category;
  final String path;

  IconItem({
    required this.name,
    required this.library,
    required this.category,
    required this.path,
  });

  String get key => '${library}_${name}';
}
