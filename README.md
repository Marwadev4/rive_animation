
# Rive + Flutter — Drive Animations

This project demonstrates using Rive animations in a Flutter app. It includes example widgets for a login animation and a story-driven animation using Rive assets found in the `assets/` folder.

**Overview**
- **Project:** Rive animations integrated into Flutter
- **Key files:** `lib/story_animation.dart`, `lib/login_screen.dart`
- **Assets:** `assets/animation_login.riv`, `assets/cow.riv`

**Features**
- Load and play Rive `.riv` files from assets
- Widgetized animations to drop into screens (`StoryAnimation`, `LoginScreen`)

**Dependencies**
Add the Rive package to your `pubspec.yaml`:

```yaml
dependencies:
	flutter:
		sdk: flutter
	rive: ^0.10.0
```

Also ensure your `pubspec.yaml` lists the assets:

```yaml
flutter:
	assets:
		- assets/animation_login.riv
		- assets/cow.riv
```

**How to use**
- Import and use the prebuilt widgets in your app:

```dart
import 'package:rive/rive.dart';
import 'story_animation.dart';
import 'login_screen.dart';

// Example usage inside a Flutter build method
@override
Widget build(BuildContext context) {
	return MaterialApp(
		home: Scaffold(
			body: Center(
				child: LoginScreen(), // uses assets/animation_login.riv
			),
		),
	);
}
```

- Use `StoryAnimation` where you want to show longer or state-driven animations (see `lib/story_animation.dart`).

**Notes about `lib/story_animation.dart` and `lib/login_screen.dart`**
- `login_screen.dart` is intended as a self-contained login UI that plays the `animation_login.riv` file. It should handle input and trigger simple Rive state changes.
- `story_animation.dart` is intended to host a sequence or interactive animation (for example using `cow.riv`). It should expose a widget (e.g., `StoryAnimation`) that can be placed into layouts.

If you want, I can open and add inline README sections showing the exact constructors and methods used in those files.

**Run the app**

1. Get dependencies:

```bash
flutter pub get
```

2. Run on a device or emulator:

```bash
flutter run
```

**Debugging tips**
- If an asset fails to load, confirm the path in `pubspec.yaml` and that the file exists under `assets/`.
- Use the Rive editor to inspect artboard names and state machine names; ensure the names used in code match.

**Next steps**
- Add README examples showing the exact API used in `lib/story_animation.dart` and `lib/login_screen.dart`.
- Include screenshots or an animated GIF demonstrating the animations in action.

---
Generated: updated README for Rive + Flutter usage.

