# flutter_icons_animated

<div align="center">

![Flutter Icons Animated](https://img.shields.io/badge/Flutter-Icons%20Animated-blue?style=for-the-badge&logo=flutter)
![Version](https://img.shields.io/badge/version-1.8.1-green?style=for-the-badge)
![Icons](https://img.shields.io/badge/icons-2,898+-orange?style=for-the-badge)
![Libraries](https://img.shields.io/badge/libraries-14-purple?style=for-the-badge)
![Crypto](https://img.shields.io/badge/crypto-25+-gold?style=for-the-badge)
![Flowers](https://img.shields.io/badge/flowers-12+-pink?style=for-the-badge)
![Medical](https://img.shields.io/badge/medical-96+-teal?style=for-the-badge)
![Emoji](https://img.shields.io/badge/emoji-60+-yellow?style=for-the-badge)
![Communication](https://img.shields.io/badge/communication-10+-blue?style=for-the-badge)
![Summer](https://img.shields.io/badge/summer-89+-orange?style=for-the-badge)
![Superhero](https://img.shields.io/badge/superhero-13+-red?style=for-the-badge)
![Fitness](https://img.shields.io/badge/fitness-100+-green?style=for-the-badge)
![Weather](https://img.shields.io/badge/weather-40+-blue?style=for-the-badge)

**🎨 A comprehensive collection of 2,898+ animated icons from 14 premium libraries, including 25+ cryptocurrency icons, 12+ beautiful flower icons, 96+ medical healthcare icons in 3 styles, 60+ fun emoji icons, 10+ communication icons, 89+ summer beach icons, 13+ superhero character icons, 100+ fitness and health icons, and 40+ weather icons**

[![Forked & Updated](https://img.shields.io/badge/FORKED%20%26%20UPDATED-red?style=for-the-badge&logo=github)](https://github.com)
[![Enhanced Features](https://img.shields.io/badge/Enhanced%20Features-green?style=for-the-badge)](https://github.com)

</div>

## 🚀 What's New in This Fork

This is a **forked and enhanced version** of the original flutter_animated_icons package with significant improvements:

- ✅ **Updated Dependencies**: Latest Flutter SDK and package versions
- ✅ **Fixed Asset Paths**: All icons now load correctly
- ✅ **Enhanced Examples**: Comprehensive usage examples for all libraries
- ✅ **Modern UI**: Beautiful example app with search, filtering, and autoplay
- ✅ **Better Documentation**: Complete usage guide with code examples
- ✅ **Performance Optimized**: Improved loading and animation performance
- ✅ **Git Integration**: Proper version control and commit history
- 🪙 **NEW: Cryptocurrency Icons**: 25+ crypto icons including Bitcoin, Ethereum, Solana, and more
- 🌸 **NEW: Flower Icons**: 12+ beautiful flower and nature icons for botanical and natural themes
- 🏥 **NEW: Medical Icons**: 96+ medical and healthcare icons in 3 styles (Filled, Flat, Outline) for health apps and medical interfaces
- 😊 **NEW: Emoji Icons**: 60+ fun and expressive emoji icons for social apps, messaging, and fun interfaces
- 📞 **NEW: Communication Icons**: 10+ communication and messaging icons for email, phone, and notifications
- ☀️ **NEW: Summer Icons**: 89+ summer and beach themed icons for vacation, travel, and summer apps
- 🦸 **NEW: Superhero Icons**: 13+ superhero character icons for gaming, entertainment, and character-based apps
- 💪 **NEW: Fitness Icons**: 100+ fitness and health icons for workout apps, health tracking, and fitness interfaces
- 🌤️ **NEW: Weather Icons**: 40+ weather condition icons for weather apps and environmental interfaces

## 📦 Package Overview

Animation always adds life to your icons. This package collects **2,898+ animated icons** from 14 premium libraries, including 25+ cryptocurrency icons, 12+ beautiful flower icons, 96+ medical healthcare icons in 3 styles, 60+ fun emoji icons, 10+ communication icons, 89+ summer beach icons, 13+ superhero character icons, 100+ fitness and health icons, and 40+ weather icons. The animated icons are implemented using [Lottie](https://lottiefiles.com/) animation, providing smooth, high-quality animations for your Flutter apps.

## 🎯 Icon Libraries

| Library | Icons | Description | Color |
|---------|-------|-------------|-------|
| **Icons8** | 1,187 | Professional icon library with high-quality animations | 🔵 Blue |
| **LottieFiles** | 756 | Community-driven animations with diverse styles | 🟢 Green |
| **UseAnimations** | 80 | Clean and modern micro-interactions | 🟠 Orange |
| **Lordicon** | 154 | Premium animated icons with multiple styles | 🟣 Purple |
| **LottieFlow** | 277 | Creative and artistic animations | 🟦 Teal |
| **Crypto** | 25 | Cryptocurrency animated icons (Bitcoin, Ethereum, etc.) | 🟡 Gold |
| **Flowers** | 12+ | Beautiful flower and nature animated icons | 🌸 Pink |
| **Medical** | 96+ | Medical and healthcare animated icons in 3 styles | 🏥 Teal |
| **Emoji** | 60+ | Fun and expressive emoji animated icons | 😊 Yellow |
| **Communication** | 10+ | Communication and messaging animated icons | 📞 Blue |
| **Summer** | 89+ | Summer and beach themed animated icons | ☀️ Orange |
| **Superhero** | 13+ | Superhero character animated icons | 🦸 Red |
| **Fitness** | 100+ | Fitness and health animated icons | 💪 Green |
| **Weather** | 40+ | Weather condition animated icons | 🌤️ Blue |

## 📱 Examples

### 🆕 New Unified Approach (Recommended)
Use the new `IconsAnimated` class to access all icons from a single place:

```dart
import 'package:flutter_icons_animated/flutter_icons_animated.dart';

// All icons accessible from one class
Lottie.asset(IconsAnimated.bitcoin)           // Crypto
Lottie.asset(IconsAnimated.flower)            // Flowers
Lottie.asset(IconsAnimated.filledStethoscope) // Medical
Lottie.asset(IconsAnimated.emoji01)           // Emoji
Lottie.asset(IconsAnimated.phoneInTalk)       // Communication
```

### 🔄 Legacy Approach (Still Supported)
You can still use the individual library classes:

```dart
import 'package:flutter_icons_animated/flutter_icons_animated.dart';

// Individual library access
Lottie.asset(Crypto.bitcoin)
Lottie.asset(Flowers.flower)
Lottie.asset(Medical.filledStethoscope)
Lottie.asset(Emoji.emoji01)
```

### Example 1: Complete Icon Browser
A full-featured app with search, filtering, and autoplay functionality:
```bash
cd example
flutter run
```

### Example 2: Usage Guide
Comprehensive examples showing how to use all libraries:
```bash
cd example2
flutter run
```

## 🚀 Quick Start

### 1. Add Dependency

```yaml
dependencies:
  flutter_icons_animated:
    git:
      url: https://github.com/your-username/flutter_icons_animated.git
  lottie: ^3.3.2
```

### 2. Import Package

```dart
import 'package:flutter_icons_animated/flutter_animated_icons.dart';
import 'package:lottie/lottie.dart';
```

### 3. Basic Usage

```dart
// Simple usage
Lottie.asset(Icons8.heart_color)

// With animation controller
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> 
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
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
    return IconButton(
      onPressed: () {
        _controller.reset();
        _controller.forward();
      },
      icon: Lottie.asset(
        Icons8.heart_color,
        controller: _controller,
        width: 50,
        height: 50,
      ),
    );
  }
}
```

## 📚 Library Usage Examples

### Icons8 Library
```dart
// Basic usage
Lottie.asset(Icons8.heart_color)
Lottie.asset(Icons8.trash)
Lottie.asset(Icons8.settings)

// With controller
Lottie.asset(
  Icons8.heart_color,
  controller: _controller,
  width: 50,
  height: 50,
)
```

### LottieFiles Library
```dart
// Basic usage
Lottie.asset(LottieFiles.$63128_bell_icon)
Lottie.asset(LottieFiles.$33262_icons_bell_notification)

// With repeat animation
Lottie.asset(
  LottieFiles.$63128_bell_icon,
  controller: _controller,
  repeat: true,
)
```

### UseAnimations Library
```dart
// Basic usage
Lottie.asset(Useanimations.menuV3)
Lottie.asset(Useanimations.activity)

// Different colors
Lottie.asset(Useanimations.menuV3Blue)  // Blue version
Lottie.asset(Useanimations.menuV3)      // Default version
```

### Lordicon Library
```dart
// Basic usage
Lottie.asset(Lordicon.$1_share_outline)
Lottie.asset(Lordicon.$2_heart_solid)

// Different styles
Lottie.asset(Lordicon.$1_share_solid)   // Solid version
Lottie.asset(Lordicon.$1_share_outline) // Outline version
```

### LottieFlow Library
```dart
// Basic usage
Lottie.asset(LottieFlow.lottieflow_404_12_1_000000_easey)
Lottie.asset(LottieFlow.lottieflow_arrow_03_1_000000_easey)

// Background animations
Lottie.asset(LottieFlow.lottieflow_background_13_000000_easey)
```

### Crypto Library
```dart
// Major cryptocurrencies
Lottie.asset(Crypto.bitcoin)
Lottie.asset(Crypto.ethereum)
Lottie.asset(Crypto.solana)
Lottie.asset(Crypto.bnb)
Lottie.asset(Crypto.cardano)

// Stablecoins
Lottie.asset(Crypto.tether)
Lottie.asset(Crypto.usdCoin)

// Meme coins
Lottie.asset(Crypto.shibaInu)
Lottie.asset(Crypto.doge)

// DeFi tokens
Lottie.asset(Crypto.uniswap)
Lottie.asset(Crypto.pancakeswap)

// Gaming/Metaverse
Lottie.asset(Crypto.decentraland)
Lottie.asset(Crypto.sandbox)
Lottie.asset(Crypto.gala)
```

### Flowers Library
```dart
// Beautiful flowers
Lottie.asset(Flowers.flower)
Lottie.asset(Flowers.pinkFlower)
Lottie.asset(Flowers.purpleFlower)
Lottie.asset(Flowers.curveFlower01)
Lottie.asset(Flowers.curveFlower02)

// Flower lines and designs
Lottie.asset(Flowers.flowerLine)
Lottie.asset(Flowers.flowerThinLine)
Lottie.asset(Flowers.curveFlowerLine)
Lottie.asset(Flowers.straightFlowerLine)

// Nature elements
Lottie.asset(Flowers.leaf)
Lottie.asset(Flowers.greenLeaves)

// Frames
Lottie.asset(Flowers.frame)
```

### Medical Library
```dart
// Filled Medical Icons
Lottie.asset(Medical.filledStethoscope)
Lottie.asset(Medical.filledHospital)
Lottie.asset(Medical.filledBloodTest)
Lottie.asset(Medical.filledThermometer)
Lottie.asset(Medical.filledAmbulance)

// Flat Medical Icons
Lottie.asset(Medical.flatStethoscope)
Lottie.asset(Medical.flatHospital)
Lottie.asset(Medical.flatBloodTest)
Lottie.asset(Medical.flatThermometer)
Lottie.asset(Medical.flatAmbulance)

// Outline Medical Icons
Lottie.asset(Medical.outlineStethoscope)
Lottie.asset(Medical.outlineHospital)
Lottie.asset(Medical.outlineBloodTest)
Lottie.asset(Medical.outlineThermometer)
Lottie.asset(Medical.outlineAmbulance)

// Medical Equipment
Lottie.asset(Medical.filledEcg)
Lottie.asset(Medical.filledXray)
Lottie.asset(Medical.filledUltrasound)
Lottie.asset(Medical.filledHeartRateMonitor)

// Medical Procedures
Lottie.asset(Medical.filledTakingBlood)
Lottie.asset(Medical.filledInfusion)
Lottie.asset(Medical.filledEyeInspection)
Lottie.asset(Medical.filledTeethCheckRoutine)

// Healthcare Facilities
Lottie.asset(Medical.filledHospitalBed)
Lottie.asset(Medical.filledHospitalChair)
Lottie.asset(Medical.filledDoctorBag)

// Medications & Treatment
Lottie.asset(Medical.filledDrugs)
Lottie.asset(Medical.filledMedication)
Lottie.asset(Medical.filledPlasterWound)
Lottie.asset(Medical.filledDoctorWritingPrescription)

// Health Monitoring
Lottie.asset(Medical.filledHealthyHeart)
Lottie.asset(Medical.filledHeartCare)
Lottie.asset(Medical.filledCardioReport)
Lottie.asset(Medical.filledDietList)

// Protection & Safety
Lottie.asset(Medical.filledVirusProtection)
Lottie.asset(Medical.filledCoronaMask)
Lottie.asset(Medical.filledVaccinationCard)
```

### Emoji Library
```dart
// Happy Emojis
Lottie.asset(Emoji.emoji01)
Lottie.asset(Emoji.emoji02)
Lottie.asset(Emoji.emoji03)
Lottie.asset(Emoji.emoji04)
Lottie.asset(Emoji.emoji05)

// Expressive Emojis
Lottie.asset(Emoji.emoji11)
Lottie.asset(Emoji.emoji12)
Lottie.asset(Emoji.emoji13)
Lottie.asset(Emoji.emoji14)
Lottie.asset(Emoji.emoji15)

// Action Emojis
Lottie.asset(Emoji.emoji21)
Lottie.asset(Emoji.emoji22)
Lottie.asset(Emoji.emoji23)
Lottie.asset(Emoji.emoji24)
Lottie.asset(Emoji.emoji25)

// Special Emojis
Lottie.asset(Emoji.emoji31)
Lottie.asset(Emoji.emoji32)
Lottie.asset(Emoji.emoji33)
Lottie.asset(Emoji.emoji34)
Lottie.asset(Emoji.emoji35)

// Fun Emojis
Lottie.asset(Emoji.emoji41)
Lottie.asset(Emoji.emoji42)
Lottie.asset(Emoji.emoji43)
Lottie.asset(Emoji.emoji44)
Lottie.asset(Emoji.emoji45)

// More Emojis
Lottie.asset(Emoji.emoji51)
Lottie.asset(Emoji.emoji52)
Lottie.asset(Emoji.emoji53)
Lottie.asset(Emoji.emoji54)
Lottie.asset(Emoji.emoji55)
```

### Communication Library
```dart
// Email and messaging
Lottie.asset(IconsAnimated.markEmailRead)
Lottie.asset(IconsAnimated.markEmailUnread)
Lottie.asset(IconsAnimated.outgoingMail)
Lottie.asset(IconsAnimated.moveToInbox)

// Phone and communication
Lottie.asset(IconsAnimated.phoneInTalk)
Lottie.asset(IconsAnimated.permPhoneMsg)

// Notifications
Lottie.asset(IconsAnimated.notifications)
Lottie.asset(IconsAnimated.notificationsActive)
Lottie.asset(IconsAnimated.notificationsOff)

// Search and contacts
Lottie.asset(IconsAnimated.personSearch)
```

### Summer Library
```dart
// Beach & Water Activities
Lottie.asset(IconsAnimated.beachBall01)
Lottie.asset(IconsAnimated.beachUmbrella01)
Lottie.asset(IconsAnimated.surfBoard01)
Lottie.asset(IconsAnimated.sailBoat)
Lottie.asset(IconsAnimated.pool01)

// Food & Drinks
Lottie.asset(IconsAnimated.iceCream01)
Lottie.asset(IconsAnimated.coctail01)
Lottie.asset(IconsAnimated.watermelon)
Lottie.asset(IconsAnimated.strawberry)
Lottie.asset(IconsAnimated.pineapple)

// Sea Life
Lottie.asset(IconsAnimated.whale)
Lottie.asset(IconsAnimated.crab)
Lottie.asset(IconsAnimated.fish01)
Lottie.asset(IconsAnimated.lobster)
Lottie.asset(IconsAnimated.flamingo)

// Summer Accessories
Lottie.asset(IconsAnimated.sunglasses01)
Lottie.asset(IconsAnimated.hat01)
Lottie.asset(IconsAnimated.fan)
Lottie.asset(IconsAnimated.termometer)

// Weather & Environment
Lottie.asset(IconsAnimated.sun01)
Lottie.asset(IconsAnimated.firePit)
Lottie.asset(IconsAnimated.tree)

// People
Lottie.asset(IconsAnimated.man01)
Lottie.asset(IconsAnimated.woman01)

// Photography & Technology
Lottie.asset(IconsAnimated.camera)
Lottie.asset(IconsAnimated.guitar)
Lottie.asset(IconsAnimated.speaker)
```

### Superhero Library
```dart
// Emotions & Expressions
Lottie.asset(IconsAnimated.angry)
Lottie.asset(IconsAnimated.sad)
Lottie.asset(IconsAnimated.gotIdea)

// Actions & Activities
Lottie.asset(IconsAnimated.pointing)
Lottie.asset(IconsAnimated.wavingHand)
Lottie.asset(IconsAnimated.waiting)
Lottie.asset(IconsAnimated.shopping)

// Transportation
Lottie.asset(IconsAnimated.drivingCar)
Lottie.asset(IconsAnimated.ridingBike)

// Work & Technology
Lottie.asset(IconsAnimated.workingOnLaptop)
Lottie.asset(IconsAnimated.holdingPhone)

// Achievements & Recognition
Lottie.asset(IconsAnimated.holdingTrophy)
Lottie.asset(IconsAnimated.holdingOfferBoard)
```

### Fitness Library
```dart
// Body Parts - Women
Lottie.asset(IconsAnimated.womanAbs)
Lottie.asset(IconsAnimated.womanBiceps)
Lottie.asset(IconsAnimated.womanChest)
Lottie.asset(IconsAnimated.womanFigure)

// Body Parts - Men
Lottie.asset(IconsAnimated.manAbs)
Lottie.asset(IconsAnimated.manBiceps)
Lottie.asset(IconsAnimated.manChest)
Lottie.asset(IconsAnimated.manFigure)

// Equipment & Machines
Lottie.asset(IconsAnimated.weights01)
Lottie.asset(IconsAnimated.weightlifting)
Lottie.asset(IconsAnimated.kettleBells01)
Lottie.asset(IconsAnimated.smithMachine)
Lottie.asset(IconsAnimated.pullUpBar)
Lottie.asset(IconsAnimated.punchingBag)

// Cardio Equipment
Lottie.asset(IconsAnimated.treadmill)
Lottie.asset(IconsAnimated.spinBike)
Lottie.asset(IconsAnimated.skippingRope01)

// Swimming
Lottie.asset(IconsAnimated.swimmingIcon01)
Lottie.asset(IconsAnimated.swimmingIcon02)

// Running & Activities
Lottie.asset(IconsAnimated.runningMan)
Lottie.asset(IconsAnimated.runningWoman)
Lottie.asset(IconsAnimated.runningParkour01)

// Tracking & Monitoring
Lottie.asset(IconsAnimated.stepTracker01)
Lottie.asset(IconsAnimated.sleepTracker01)
Lottie.asset(IconsAnimated.waterTracker01)
Lottie.asset(IconsAnimated.weightTracker)
Lottie.asset(IconsAnimated.repsTracker)

// Timers & Clocks
Lottie.asset(IconsAnimated.timer01)
Lottie.asset(IconsAnimated.smartWatch)
Lottie.asset(IconsAnimated.whistle)

// Nutrition & Hydration
Lottie.asset(IconsAnimated.waterIcon)
Lottie.asset(IconsAnimated.waterBottle)
Lottie.asset(IconsAnimated.supplements)

// Sleep & Recovery
Lottie.asset(IconsAnimated.sleepingIcon01)
Lottie.asset(IconsAnimated.sleepingIcon02)

// Measurements & Progress
Lottie.asset(IconsAnimated.measure01)
Lottie.asset(IconsAnimated.progressIcon)
Lottie.asset(IconsAnimated.weightProgressGraphic)

// Performance & Analytics
Lottie.asset(IconsAnimated.workoutIntensityGraphic01)
Lottie.asset(IconsAnimated.weeklyPerformanceGraphic01)

// Achievements & Recognition
Lottie.asset(IconsAnimated.trophy)
Lottie.asset(IconsAnimated.medal)
Lottie.asset(IconsAnimated.strengthIcon)
```

### Weather Library
```dart
// Clouds & Sky
Lottie.asset(IconsAnimated.cloudDark)
Lottie.asset(IconsAnimated.cloudLight)
Lottie.asset(IconsAnimated.clouds)
Lottie.asset(IconsAnimated.cloudySun)
Lottie.asset(IconsAnimated.cloudySunWind)
Lottie.asset(IconsAnimated.cloudyFullMoon)
Lottie.asset(IconsAnimated.cloudyHalfMoon)

// Sun & Solar
Lottie.asset(IconsAnimated.sun)
Lottie.asset(IconsAnimated.sunSet)
Lottie.asset(IconsAnimated.sunEclipse)
Lottie.asset(IconsAnimated.sunAndRain)

// Moon & Night
Lottie.asset(IconsAnimated.fullMoon)
Lottie.asset(IconsAnimated.halfMoon)
Lottie.asset(IconsAnimated.fullMoonAndRain)
Lottie.asset(IconsAnimated.fullMoonAndSnow)
Lottie.asset(IconsAnimated.halfMoonAndRain)
Lottie.asset(IconsAnimated.halfMoonAndSnow)
Lottie.asset(IconsAnimated.star)

// Rain & Precipitation
Lottie.asset(IconsAnimated.mildRain)
Lottie.asset(IconsAnimated.heavyRain)
Lottie.asset(IconsAnimated.rainingV1)
Lottie.asset(IconsAnimated.rainingV2)

// Snow & Winter
Lottie.asset(IconsAnimated.snow)
Lottie.asset(IconsAnimated.snowflake)
Lottie.asset(IconsAnimated.snowfallV1)
Lottie.asset(IconsAnimated.snowfallV2)
Lottie.asset(IconsAnimated.hail)

// Storms & Thunder
Lottie.asset(IconsAnimated.thunderV1)
Lottie.asset(IconsAnimated.thunderV2)
Lottie.asset(IconsAnimated.lightning)
Lottie.asset(IconsAnimated.storm)

// Wind & Air
Lottie.asset(IconsAnimated.wind)
Lottie.asset(IconsAnimated.mistV1)
Lottie.asset(IconsAnimated.mistV2)

// Temperature
Lottie.asset(IconsAnimated.hotTemperature)
Lottie.asset(IconsAnimated.coldTemperature)

// Special Weather
Lottie.asset(IconsAnimated.rainbow)
Lottie.asset(IconsAnimated.uvMeter)
Lottie.asset(IconsAnimated.normalWeatherV1)
Lottie.asset(IconsAnimated.normalWeatherV2)
```

## 🎨 Advanced Usage

### Custom Animation Controller
```dart
class AnimatedIconWidget extends StatefulWidget {
  final String iconPath;
  
  const AnimatedIconWidget({Key? key, required this.iconPath}) : super(key: key);

  @override
  _AnimatedIconWidgetState createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1500),
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
    return GestureDetector(
      onTap: () {
        if (_controller.isAnimating) {
          _controller.stop();
        } else {
          _controller.repeat();
        }
      },
      child: Lottie.asset(
        widget.iconPath,
        controller: _controller,
        width: 60,
        height: 60,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.error_outline, color: Colors.grey);
        },
      ),
    );
  }
}
```

### Error Handling
```dart
Lottie.asset(
  Icons8.heart_color,
  controller: _controller,
  errorBuilder: (context, error, stackTrace) {
    return Icon(Icons.error_outline, color: Colors.grey);
  },
)
```

## 💡 Best Practices

1. **Always dispose AnimationControllers** in the dispose() method
2. **Use Lottie.asset()** for better performance than Lottie.network()
3. **Provide errorBuilder** to handle loading failures gracefully
4. **Use appropriate sizes** based on your UI design
5. **Consider animation duration** for better user experience
6. **Test on different devices** to ensure smooth performance

## 🔧 Troubleshooting

### Icons not loading?
- Make sure you've added the package dependency correctly
- Check that the asset paths are correct
- Verify that the Lottie package is included

### Animation not working?
- Ensure you have an AnimationController
- Check that the controller is properly initialized
- Make sure to call controller.forward() or controller.repeat()

### Performance issues?
- Use Lottie.asset() instead of Lottie.network()
- Dispose AnimationControllers properly
- Consider using smaller icon sizes for better performance

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## ⭐ Star History

If you find this package useful, please give it a star! ⭐

---

<div align="center">

**Made with ❤️ for the Flutter community**

[![GitHub](https://img.shields.io/badge/GitHub-Repository-black?style=for-the-badge&logo=github)](https://github.com)
[![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue?style=for-the-badge&logo=flutter)](https://flutter.dev)

</div>
