import 'package:flutter/material.dart';
import 'package:flutter_icons_animated/flutter_animated_icons.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Icons Animated - Complete Usage Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const UsageExamplesPage(),
    );
  }
}

class UsageExamplesPage extends StatefulWidget {
  const UsageExamplesPage({Key? key}) : super(key: key);

  @override
  State<UsageExamplesPage> createState() => _UsageExamplesPageState();
}

class _UsageExamplesPageState extends State<UsageExamplesPage>
    with TickerProviderStateMixin {
  late AnimationController _icons8Controller;
  late AnimationController _lottieFilesController;
  late AnimationController _useAnimationsController;
  late AnimationController _lordiconController;
  late AnimationController _lottieFlowController;

  @override
  void initState() {
    super.initState();
    _icons8Controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _lottieFilesController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _useAnimationsController = AnimationController(
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
    _lottieFilesController.dispose();
    _useAnimationsController.dispose();
    _lordiconController.dispose();
    _lottieFlowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Usage Examples'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('📦 Package Information'),
            _buildInfoCard(),
            
            const SizedBox(height: 24),
            
            _buildSectionTitle('🎯 Icons8 Library Examples'),
            _buildIcons8Examples(),
            
            const SizedBox(height: 24),
            
            _buildSectionTitle('🎨 LottieFiles Library Examples'),
            _buildLottieFilesExamples(),
            
            const SizedBox(height: 24),
            
            _buildSectionTitle('✨ UseAnimations Library Examples'),
            _buildUseAnimationsExamples(),
            
            const SizedBox(height: 24),
            
            _buildSectionTitle('👑 Lordicon Library Examples'),
            _buildLordiconExamples(),
            
            const SizedBox(height: 24),
            
            _buildSectionTitle('🌊 LottieFlow Library Examples'),
            _buildLottieFlowExamples(),
            
            const SizedBox(height: 24),
            
            _buildSectionTitle('💡 Usage Tips & Best Practices'),
            _buildUsageTips(),
            
            const SizedBox(height: 100), // Bottom padding
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Flutter Icons Animated',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'A comprehensive collection of 2,454+ animated icons from 5 premium libraries.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildInfoChip('Icons8', '1,187 icons', Colors.blue),
                _buildInfoChip('LottieFiles', '756 icons', Colors.green),
                _buildInfoChip('UseAnimations', '80 icons', Colors.orange),
                _buildInfoChip('Lordicon', '154 icons', Colors.purple),
                _buildInfoChip('LottieFlow', '277 icons', Colors.teal),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.withOpacity(0.3)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.fork_right, color: Colors.red, size: 16),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Forked & Updated Package - Enhanced with modern features and comprehensive examples',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label, String count, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        '$label: $count',
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildIcons8Examples() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Icons8 - Professional icon library with 1,187+ icons',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            _buildCodeExample('''
// Basic usage
Lottie.asset(Icons8.beating_hearts)

// With animation controller
Lottie.asset(
  Icons8.beating_hearts,
  controller: _controller,
  width: 50,
  height: 50,
)

// Tap to animate
IconButton(
  onPressed: () {
    _controller.reset();
    _controller.forward();
  },
  icon: Lottie.asset(Icons8.beating_hearts, controller: _controller),
)'''),
            const SizedBox(height: 16),
            _buildIconGrid([
              {'path': Icons8.beating_hearts, 'name': 'beating_hearts'},
              {'path': Icons8.icons8_trash_1_, 'name': 'trash'},
              {'path': Icons8.settings, 'name': 'settings'},
              {'path': Icons8.bookmark, 'name': 'bookmark'},
            ], _icons8Controller),
          ],
        ),
      ),
    );
  }

  Widget _buildLottieFilesExamples() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'LottieFiles - High-quality animations with 756+ icons',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            _buildCodeExample('''
// Basic usage
Lottie.asset(LottieFiles.\$33262_icons_bell_notification)

// With repeat animation
Lottie.asset(
  LottieFiles.\$33262_icons_bell_notification,
  controller: _controller,
  repeat: true,
)

// Custom styling
Lottie.asset(
  LottieFiles.\$33262_icons_bell_notification,
  controller: _controller,
  width: 100,
  height: 100,
  fit: BoxFit.contain,
)'''),
            const SizedBox(height: 16),
            _buildIconGrid([
              {'path': LottieFiles.$33262_icons_bell_notification, 'name': 'bell_notification'},
              {'path': LottieFiles.$40048_bell_icon_notification, 'name': 'bell_icon'},
              {'path': LottieFiles.$33262_icons_bell_notification, 'name': 'notification'},
              {'path': LottieFiles.$40048_bell_icon_notification, 'name': 'bell'},
            ], _lottieFilesController),
          ],
        ),
      ),
    );
  }

  Widget _buildUseAnimationsExamples() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'UseAnimations - Clean and modern animations with 80+ icons',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            _buildCodeExample('''
// Basic usage
Lottie.asset(Useanimations.menu)

// Toggle animation
Lottie.asset(
  Useanimations.menu,
  controller: _controller,
  animate: true,
)

// Different versions
Lottie.asset(Useanimations.menuV2)  // Version 2
Lottie.asset(Useanimations.menu)    // Default version'''),
            const SizedBox(height: 16),
            _buildIconGrid([
              {'path': Useanimations.menu, 'name': 'menu'},
              {'path': Useanimations.menuV2, 'name': 'menuV2'},
              {'path': Useanimations.activity, 'name': 'activity'},
              {'path': Useanimations.airplay, 'name': 'airplay'},
            ], _useAnimationsController),
          ],
        ),
      ),
    );
  }

  Widget _buildLordiconExamples() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lordicon - Premium animated icons with 154+ icons',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            _buildCodeExample('''
// Basic usage
Lottie.asset(Lordicon.\$1_share_outline)

// With error handling
Lottie.asset(
  Lordicon.\$1_share_outline,
  controller: _controller,
  errorBuilder: (context, error, stackTrace) {
    return Icon(Icons.error);
  },
)

// Different styles
Lottie.asset(Lordicon.\$1_share_solid)   // Solid version
Lottie.asset(Lordicon.\$1_share_outline) // Outline version'''),
            const SizedBox(height: 16),
            _buildIconGrid([
              {'path': Lordicon.$1_share_outline, 'name': 'share_outline'},
              {'path': Lordicon.$1_share_solid, 'name': 'share_solid'},
              {'path': Lordicon.$48_favorite_heart_outline, 'name': 'heart_outline'},
              {'path': Lordicon.$48_favorite_heart_solid, 'name': 'heart_solid'},
            ], _lordiconController),
          ],
        ),
      ),
    );
  }

  Widget _buildLottieFlowExamples() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'LottieFlow - Creative animations with 277+ icons',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            _buildCodeExample('''
// Basic usage
Lottie.asset(LottieFlow.lottieflow_404_12_1_000000_easey)

// With custom duration
Lottie.asset(
  LottieFlow.lottieflow_404_12_1_000000_easey,
  controller: _controller,
  frameRate: FrameRate(60),
)

// Background animations
Lottie.asset(LottieFlow.lottieflow_background_13_000000_easey)'''),
            const SizedBox(height: 16),
            _buildIconGrid([
              {'path': LottieFlow.lottieflow_404_12_1_000000_easey, 'name': '404_1'},
              {'path': LottieFlow.lottieflow_404_12_2_000000_easey, 'name': '404_2'},
              {'path': LottieFlow.lottieflow_arrow_03_1_000000_easey, 'name': 'arrow_03'},
              {'path': LottieFlow.lottieflow_arrow_05_2_000000_easey, 'name': 'arrow_05'},
            ], _lottieFlowController),
          ],
        ),
      ),
    );
  }

  Widget _buildIconGrid(List<Map<String, String>> icons, AnimationController controller) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: icons.length,
      itemBuilder: (context, index) {
        final icon = icons[index];
        return Card(
          elevation: 2,
          child: InkWell(
            onTap: () {
              controller.reset();
              controller.forward();
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Lottie.asset(
                      icon['path']!,
                      controller: controller,
                      width: 40,
                      height: 40,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error_outline, color: Colors.grey);
                      },
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    icon['name']!,
                    style: const TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCodeExample(String code) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(
        code,
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 12,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildUsageTips() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '💡 Best Practices & Tips',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                Text(
                  description,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
