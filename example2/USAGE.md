# Quick Usage Guide

## 🚀 Getting Started

1. **Add dependency** to your `pubspec.yaml`:
```yaml
dependencies:
  flutter_icons_animated:
    path: ../  # or from pub.dev
  lottie: ^3.3.2
```

2. **Import the package**:
```dart
import 'package:flutter_icons_animated/flutter_animated_icons.dart';
import 'package:lottie/lottie.dart';
```

3. **Use animated icons**:
```dart
// Simple usage
Lottie.asset(Icons8.beating_hearts)

// With controller
Lottie.asset(
  Icons8.beating_hearts,
  controller: _controller,
  width: 100,
  height: 100,
)
```

## 📚 Available Libraries

| Library | Icons | Example Usage |
|---------|-------|---------------|
| **Icons8** | 1,187+ | `Icons8.beating_hearts` |
| **LottieFiles** | 756+ | `LottieFiles.$33262_icons_bell_notification` |
| **UseAnimations** | 80+ | `Useanimations.menu` |
| **Lordicon** | 154+ | `Lordicon.$1_share_outline` |
| **LottieFlow** | 277+ | `LottieFlow.lottieflow_404_12_1_000000_easey` |

## 🎯 Common Patterns

### Button with Animation
```dart
IconButton(
  onPressed: () {
    _controller.reset();
    _controller.forward();
  },
  icon: Lottie.asset(
    Icons8.beating_hearts,
    controller: _controller,
    width: 24,
    height: 24,
  ),
)
```

### Loading State
```dart
Lottie.asset(
  Useanimations.loading,
  controller: _controller,
  repeat: true,
)
```

### Error Handling
```dart
Lottie.asset(
  Icons8.some_icon,
  errorBuilder: (context, error, stackTrace) {
    return Icon(Icons.error_outline);
  },
)
```

## 💡 Pro Tips

- Use `TickerProviderStateMixin` for animation controllers
- Always dispose controllers in `dispose()` method
- Use `Lottie.asset()` for better performance than `Lottie.network()`
- Provide `errorBuilder` for robust error handling
- Use `MediaQuery` for responsive icon sizes

## 🔗 Resources

- [Full Documentation](README.md)
- [Lottie Package](https://pub.dev/packages/lottie)
- [Flutter Animation Guide](https://docs.flutter.dev/development/ui/animations)
