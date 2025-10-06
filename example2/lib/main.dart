import 'package:flutter/material.dart';
import 'package:flutter_icons_animated/flutter_animated_icons.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animated Icons Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Animated Icons Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _icons8Controller;
  late AnimationController _useAnimationsController;
  late AnimationController _lottieFilesController;
  late AnimationController _lordiconController;
  late AnimationController _lottieFlowController;

  @override
  void initState() {
    super.initState();
    _icons8Controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _useAnimationsController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _lottieFilesController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _lordiconController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _lottieFlowController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _icons8Controller.dispose();
    _useAnimationsController.dispose();
    _lottieFilesController.dispose();
    _lordiconController.dispose();
    _lottieFlowController.dispose();
    super.dispose();
  }

  void _animateIcon(AnimationController controller) {
    if (controller.isCompleted) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              _showInfoDialog();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Header
            Center(
              child: Column(
                children: [
                  const Text(
                    '2,454+ Animated Icons from 5 Premium Libraries',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tap any icon to animate it!',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Icons8 Section
            _buildLibrarySection(
              'Icons8 Library',
              '1,187+ Professional Icons',
              Colors.blue,
              [
                _buildIconExample(
                  'Beating Hearts',
                  Icons8.beating_hearts,
                  _icons8Controller,
                  'Perfect for like buttons',
                ),
                _buildIconExample(
                  'Settings',
                  Icons8.settings,
                  _icons8Controller,
                  'Animated settings gear',
                ),
                _buildIconExample(
                  'Bookmark',
                  Icons8.bookmark,
                  _icons8Controller,
                  'Save/bookmark animation',
                ),
                _buildIconExample(
                  'Trash',
                  Icons8.icons8_trash_1_,
                  _icons8Controller,
                  'Delete confirmation',
                ),
              ],
            ),

            const SizedBox(height: 24),

            // UseAnimations Section
            _buildLibrarySection(
              'UseAnimations Library',
              '80+ Clean & Modern Icons',
              Colors.green,
              [
                _buildIconExample(
                  'Menu',
                  Useanimations.menu,
                  _useAnimationsController,
                  'Hamburger menu animation',
                ),
                _buildIconExample(
                  'Menu V2',
                  Useanimations.menuV2,
                  _useAnimationsController,
                  'Alternative menu style',
                ),
                _buildIconExample(
                  'Activity',
                  Useanimations.activity,
                  _useAnimationsController,
                  'Activity indicator',
                ),
                _buildIconExample(
                  'Airplay',
                  Useanimations.airplay,
                  _useAnimationsController,
                  'Screen sharing icon',
                ),
              ],
            ),

            const SizedBox(height: 24),

            // LottieFiles Section
            _buildLibrarySection(
              'LottieFiles Library',
              '756+ High-Quality Animations',
              Colors.orange,
              [
                _buildIconExample(
                  'Bell Notification',
                  LottieFiles.$33262_icons_bell_notification,
                  _lottieFilesController,
                  'Notification bell',
                ),
                _buildIconExample(
                  'Bell Icon',
                  LottieFiles.$40048_bell_icon_notification,
                  _lottieFilesController,
                  'Alternative bell style',
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Lordicon Section
            _buildLibrarySection(
              'Lordicon Library',
              '154+ Premium Icons',
              Colors.purple,
              [
                _buildIconExample(
                  'Share Outline',
                  Lordicon.$1_share_outline,
                  _lordiconController,
                  'Share button outline',
                ),
                _buildIconExample(
                  'Share Solid',
                  Lordicon.$1_share_solid,
                  _lordiconController,
                  'Share button solid',
                ),
                _buildIconExample(
                  'Heart Outline',
                  Lordicon.$48_favorite_heart_outline,
                  _lordiconController,
                  'Heart outline style',
                ),
                _buildIconExample(
                  'Heart Solid',
                  Lordicon.$48_favorite_heart_solid,
                  _lordiconController,
                  'Heart solid style',
                ),
              ],
            ),

            const SizedBox(height: 24),

            // LottieFlow Section
            _buildLibrarySection(
              'LottieFlow Library',
              '277+ Creative Animations',
              Colors.teal,
              [
                _buildIconExample(
                  '404 Error 1',
                  LottieFlow.lottieflow_404_12_1_000000_easey,
                  _lottieFlowController,
                  '404 error animation',
                ),
                _buildIconExample(
                  '404 Error 2',
                  LottieFlow.lottieflow_404_12_2_000000_easey,
                  _lottieFlowController,
                  'Alternative 404 style',
                ),
                _buildIconExample(
                  'Arrow 03',
                  LottieFlow.lottieflow_arrow_03_1_000000_easey,
                  _lottieFlowController,
                  'Directional arrow',
                ),
                _buildIconExample(
                  'Arrow 05',
                  LottieFlow.lottieflow_arrow_05_2_000000_easey,
                  _lottieFlowController,
                  'Alternative arrow style',
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Usage Tips
            _buildUsageTips(),

            const SizedBox(height: 100), // Bottom padding
          ],
        ),
      ),
    );
  }

  Widget _buildLibrarySection(
    String title,
    String subtitle,
    Color color,
    List<Widget> icons,
  ) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 4,
                  height: 24,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: icons,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconExample(
    String name,
    String assetPath,
    AnimationController controller,
    String description,
  ) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () => _animateIcon(controller),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Lottie.asset(
                  assetPath,
                  controller: controller,
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.error_outline,
                      color: Colors.grey,
                      size: 30,
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                description,
                style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUsageTips() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '💡 Usage Tips & Best Practices',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildTip(
              '🎯 Animation Controllers',
              'Always dispose AnimationControllers in dispose() method to prevent memory leaks.',
            ),
            _buildTip(
              '⚡ Performance',
              'Use Lottie.asset() for better performance than Lottie.network() for local assets.',
            ),
            _buildTip(
              '🎨 Customization',
              'You can customize colors, size, and animation behavior using Lottie parameters.',
            ),
            _buildTip(
              '🔄 Animation States',
              'Use controller.forward(), controller.reverse(), or controller.repeat() for different effects.',
            ),
            _buildTip(
              '📱 Responsive Design',
              'Use MediaQuery to adjust icon sizes based on screen size for better UX.',
            ),
            _buildTip(
              '🛡️ Error Handling',
              'Always provide errorBuilder to handle cases where animations fail to load.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTip(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 4),
                Text(description, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showInfoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('About This Example'),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'This example demonstrates how to use the flutter_icons_animated package with 2,454+ animated icons from 5 premium libraries.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Features:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('• Interactive tap-to-animate functionality'),
                Text('• Proper animation controller management'),
                Text('• Error handling for failed animations'),
                Text('• Responsive design principles'),
                Text('• Code examples and best practices'),
                SizedBox(height: 16),
                Text(
                  'Libraries included:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('• Icons8: 1,187+ icons'),
                Text('• LottieFiles: 756+ icons'),
                Text('• UseAnimations: 80+ icons'),
                Text('• Lordicon: 154+ icons'),
                Text('• LottieFlow: 277+ icons'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
