
# Rive + Flutter — Drive Animations

This project demonstrates using Rive animations in a Flutter app. It includes example widgets for a login animation and a story-driven animation using Rive assets found in the `assets/` folder.

**Overview**
- **Project:** Rive animations integrated into Flutter
- **Key files:** `lib/story_animation.dart`, `lib/login_screen.dart`
- **Assets:** `assets/animation_login.riv`, `assets/cow.riv`

**Features**
- Load and play Rive `.riv` files from assets
- Widgetized animations to drop into screens (`StoryAnimation`, `LoginScreen`)

## 📱 Screenshots
LoginScreen
![photo_2026-01-06_18-13-38](https://github.com/user-attachments/assets/b230366d-7798-443e-ab0f-f6da49effcef)
![photo_2026-01-06_18-13-39](https://github.com/user-attachments/assets/614d0c5f-74f5-46fa-aecb-e6c309600b56)
![photo_2026-01-06_18-13-40](https://github.com/user-attachments/assets/47dc1488-b491-4033-8272-d3956f58ae83)
![photo_2026-01-06_18-13-41](https://github.com/user-attachments/assets/79d30677-9cd0-4639-b5c0-cbfae7b94bfd)
![photo_2026-01-06_18-13-42](https://github.com/user-attachments/assets/a25577fc-1708-4bc3-a6f5-fb83034e3c4e)

StoryAnimation
![photo_2026-01-06_18-10-37](https://github.com/user-attachments/assets/34abec75-5b6e-4401-88e6-47ac3eb20870)


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

