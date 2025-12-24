# `story_animation.dart` — Documentation

This document describes the `StoryAnimation` widget implemented in `lib/story_animation.dart`. The widget demonstrates how to load a Rive file, control multiple animation controllers, and optionally play audio alongside animations.

## What it does

- Loads `assets/cow.riv` at startup and attaches a default Rive animation controller.
- Provides methods to switch between four animation controllers: `water`, `cow2`, `grass`, and `grow`.
- Plays an audio asset (`assets/cow_song.mp3`) using `just_audio` when the grow animation is triggered.

## Key API

- `class StoryAnimation extends StatefulWidget` — main widget to insert into your widget tree.

Inside `_StoryAnimationState` you'll find utility methods (all internal):

- `removeAllControllers()` — removes all registered Rive controllers from the artboard.
- `waterControllerController()` — switches active controller to the `water` animation.
- `cow2ControllerController()` — switches to `cow2` animation.
- `grassControllerController()` — switches to `grass` animation.
- `growControllerController()` — switches to `grow` animation and (in the current implementation) plays the audio via `player.play()`.

The state initializes controllers in `initState()` using `SimpleAnimation(CowAnimationEnum.<name>.name)`, so the Rive state names are driven by `CowAnimationEnum` from `lib/animation_enum.dart`.

## Usage

Add the widget to your app (simple example in `main.dart`):

```dart
import 'package:flutter/material.dart';
import 'package:rive_animation/story_animation.dart';

void main() => runApp(const MaterialApp(home: StoryAnimation()));
```

This will present the Rive artboard and three IconButtons that switch animations and trigger audio for the grow action.

## Dependencies

Ensure the following packages are included in your `pubspec.yaml`:

```yaml
dependencies:
	flutter:
		sdk: flutter
	rive: ^0.10.0
	just_audio: ^0.9.0
```

Adjust the versions to the latest compatible releases.

## Assets

The widget expects these assets (add them to `pubspec.yaml` under `flutter.assets`):

```yaml
assets:
	- assets/cow.riv
	- assets/cow_song.mp3  # optional: used for the grow action
```

If you don't want audio, either remove the `player` usage or omit `cow_song.mp3` and the related `player.play()` call.

## Notes & Troubleshooting

- If the artboard doesn't show, ensure `assets/cow.riv` exists and is referenced in `pubspec.yaml` and run `flutter pub get`.
- The code uses `SimpleAnimation` with names taken from `CowAnimationEnum`; make sure your `.riv` animation/state names match those enum values.
- If audio doesn't play, verify `assets/cow_song.mp3` exists, and check permissions/configuration for the target platform.

## Suggestions

- Consider refactoring the controller-switching methods into a single method that accepts an enum/value to avoid repetition.
- Expose a constructor parameter to allow callers to supply an alternate asset path or to disable audio for easier reuse and testing.
