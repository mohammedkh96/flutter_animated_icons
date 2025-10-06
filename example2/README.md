# Flutter Animated Icons Example

This is a comprehensive Flutter example demonstrating how to use the `flutter_icons_animated` package with 2,454+ animated icons from 5 premium libraries.

## 📦 Package Overview

The `flutter_icons_animated` package provides access to:
- **Icons8**: 1,187+ professional animated icons
- **LottieFiles**: 756+ high-quality animations  
- **UseAnimations**: 80+ clean and modern animations
- **Lordicon**: 154+ premium animated icons
- **LottieFlow**: 277+ creative animations

## 🚀 Getting Started

1. **Install Flutter** (if not already installed)
2. **Navigate to this directory**: `cd example2`
3. **Get dependencies**: `flutter pub get`
4. **Run the app**: `flutter run`

## 📱 Features Demonstrated

- ✅ Multiple icon libraries with examples
- ✅ Interactive tap-to-animate functionality
- ✅ Proper animation controller management
- ✅ Material Design 3 UI
- ✅ Error handling for failed animations
- ✅ Responsive design principles
- ✅ Code examples and best practices

## 🎯 How to Use Animated Icons

### 1. Basic Usage

```dart
import 'package:flutter_icons_animated/flutter_animated_icons.dart';
import 'package:lottie/lottie.dart';

// Simple static animation
Lottie.asset(Icons8.beating_hearts)
```

### 2. With Animation Controller

```dart
class _MyWidgetState extends State<MyWidget> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      Icons8.beating_hearts,
      controller: _controller,
      width: 100,
      height: 100,
    );
  }
}
```

### 3. Interactive Animation

```dart
GestureDetector(
  onTap: () {
    _controller.reset();
    _controller.forward();
  },
  child: Lottie.asset(
    Useanimations.menu,
    controller: _controller,
  ),
)
```

### 4. Different Libraries

```dart
// Icons8
Lottie.asset(Icons8.settings)
Lottie.asset(Icons8.bookmark)

// UseAnimations  
Lottie.asset(Useanimations.menu)
Lottie.asset(Useanimations.menuV2)

// LottieFiles
Lottie.asset(LottieFiles.$33262_icons_bell_notification)

// Lordicon
Lottie.asset(Lordicon.$1_share_outline)
Lottie.asset(Lordicon.$1_share_solid)

// LottieFlow
Lottie.asset(LottieFlow.lottieflow_404_12_1_000000_easey)
```

## 💡 Best Practices

### Animation Controllers
- Always dispose AnimationControllers in `dispose()` method
- Use `TickerProviderStateMixin` for single controller
- Use `TickerProviderStateMixin` for multiple controllers

### Performance
- Use `Lottie.asset()` for local assets (better performance)
- Avoid `Lottie.network()` unless necessary
- Consider caching for frequently used animations

### Error Handling
```dart
Lottie.asset(
  Icons8.some_icon,
  errorBuilder: (context, error, stackTrace) {
    return Icon(Icons.error_outline);
  },
)
```

### Responsive Design
```dart
Lottie.asset(
  Icons8.settings,
  width: MediaQuery.of(context).size.width * 0.1,
  height: MediaQuery.of(context).size.width * 0.1,
)
```

## 🎨 Customization Options

```dart
Lottie.asset(
  Icons8.beating_hearts,
  controller: _controller,
  width: 100,
  height: 100,
  fit: BoxFit.contain,
  repeat: true,
  animate: true,
  frameRate: FrameRate(60),
)
```

## 📁 Project Structure

```
example2/
├── lib/
│   └── main.dart          # Main application with examples
├── test/
│   └── widget_test.dart   # Widget tests
├── pubspec.yaml           # Dependencies
└── README.md             # This file
```

## 🧪 Testing

Run the tests to verify everything works:

```bash
flutter test
```

## 🔗 Useful Resources

- [Lottie Documentation](https://pub.dev/packages/lottie)
- [Flutter Animation Guide](https://docs.flutter.dev/development/ui/animations)
- [Material Design 3](https://m3.material.io/)

## 📄 License

This example is part of the flutter_icons_animated package. Check the main package for license information.

---

**Happy animating! 🎉** This example provides a solid foundation for integrating animated icons into your Flutter applications.