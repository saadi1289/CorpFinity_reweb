## Project Structure

### Root Organization
```
corpfinity/
├── lib/                    # Dart source code
├── assets/                 # Static assets (images, illustrations)
├── test/                   # Test files
├── android/                # Android-specific code
├── ios/                    # iOS-specific code
├── web/                    # Web-specific code
├── windows/                # Windows-specific code
├── linux/                  # Linux-specific code
├── macos/                  # macOS-specific code
├── pubspec.yaml            # Dependencies and project config
└── analysis_options.yaml   # Linting and analysis rules
```

### Source Code Structure (`lib/`)
The project follows a **feature-based architecture**:

```
lib/
├── main.dart              # App entry point, theme configuration
└── features/              # Feature modules
    └── auth/              # Authentication feature
        ├── sign_in_page.dart
        └── sign_up_page.dart
```

### Assets Organization
```
assets/
└── illustrations/         # SVG illustrations for UI
```

All assets must be declared in `pubspec.yaml` under the `flutter.assets` section.

### Architecture Patterns

**Feature-Based Organization:**
- Each major feature lives in its own directory under `lib/features/`
- Features are self-contained with their own pages, widgets, and logic
- Example: `lib/features/auth/` contains all authentication-related code

**UI Patterns:**
- StatefulWidget for interactive pages with form state
- Form validation using GlobalKey<FormState>
- TextEditingController for input management with proper disposal
- Responsive design using LayoutBuilder and constraints
- Semantic labels for accessibility

**Naming Conventions:**
- Files: snake_case (e.g., `sign_in_page.dart`)
- Classes: PascalCase (e.g., `SignInPage`)
- Private classes: Prefix with underscore (e.g., `_SignInPageState`, `_Slide`)
- Variables: camelCase (e.g., `_formKey`, `_pageController`)

**Widget Organization:**
- Public page widgets at top level
- Private helper widgets prefixed with underscore (e.g., `_Slide`, `_Indicator`)
- Dispose controllers and timers in dispose() method

**Theme & Styling:**
- Centralized theme configuration in `main.dart`
- Accent color: #5FCCC4 (teal)
- Material Design 3 components
- Consistent border radius (16px for inputs and buttons)
- Stadium borders for primary action buttons
