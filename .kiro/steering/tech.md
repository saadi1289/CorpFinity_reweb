## Tech Stack

### Framework & Language
- Flutter SDK 3.8.1+
- Dart language
- Material Design 3 (useMaterial3: true)

### Key Dependencies
- `flutter_svg: ^2.0.9` - SVG rendering for illustrations
- `cupertino_icons: ^1.0.8` - iOS-style icons
- `flutter_lints: ^5.0.0` - Linting rules (dev dependency)

### Build System
Flutter's standard build system is used across all platforms.

### Common Commands

**Development:**
```bash
# Run the app in debug mode
flutter run

# Run on specific device
flutter run -d chrome

# Hot reload (press 'r' in terminal while app is running)
# Hot restart (press 'R' in terminal)
```

**Testing:**
```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

**Building:**
```bash
# Build APK (Android)
flutter build apk

# Build app bundle (Android)
flutter build appbundle

# Build iOS app
flutter build ios

# Build web app
flutter build web

# Build Windows app
flutter build windows
```

**Maintenance:**
```bash
# Get dependencies
flutter pub get

# Upgrade dependencies
flutter pub upgrade

# Check for outdated packages
flutter pub outdated

# Analyze code for issues
flutter analyze

# Format code
dart format .
```

### Code Quality
- Uses `package:flutter_lints/flutter.yaml` for recommended lints
- Analysis options configured in `analysis_options.yaml`
- Private packages (not published to pub.dev)
