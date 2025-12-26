import 'package:rive_animation/animation_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:just_audio/just_audio.dart';

class StoryAnimation extends StatefulWidget {
  const StoryAnimation({super.key});

  @override
  State<StoryAnimation> createState() => _StoryAnimationState();
}

class _StoryAnimationState extends State<StoryAnimation> {
  Artboard? riveArtboard;

  late RiveAnimationController waterController;
  late RiveAnimationController cow2Controller;
  late RiveAnimationController grassController;
  late RiveAnimationController growController;

  final player = AudioPlayer();

  void removeAllControllers() {
    riveArtboard?.artboard.removeController(waterController);
    riveArtboard?.artboard.removeController(cow2Controller);
    riveArtboard?.artboard.removeController(grassController);
    riveArtboard?.artboard.removeController(growController);
  }

  void waterControllerController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(waterController);
    debugPrint('waterController');
  }

  void cow2ControllerController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(cow2Controller);
    debugPrint('cow2Controller');
  }

  void grassControllerController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(grassController);
    debugPrint('grassController');
  }

  void growControllerController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(growController);
    debugPrint('growController');
  }

  @override
  void initState() {
    super.initState();
    player.setAsset("assets/cow_song.mp3");
    player.setSpeed(1.0);
    player.play();
    waterController = SimpleAnimation(CowAnimationEnum.water.name);
    cow2Controller = SimpleAnimation(CowAnimationEnum.cow2.name);
    grassController = SimpleAnimation(CowAnimationEnum.grass.name);
    growController = SimpleAnimation(CowAnimationEnum.grow.name);
    rootBundle.load("assets/cow.riv").then((data) {
      final RiveFile file = RiveFile.import(data);

      final artboard = file.mainArtboard;
      artboard.addController(waterController);
      setState(() {
        riveArtboard = artboard;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Rive Animation')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: riveArtboard == null
                  ? const CircularProgressIndicator()
                  : Rive(artboard: riveArtboard!),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 30,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        waterControllerController();
                      },
                      icon: Icon(Icons.water),
                    ),
                    Text("Water"),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        grassControllerController();
                      },
                      icon: Icon(Icons.grass),
                    ),
                    Text("Grass"),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        player.play();
                        growControllerController();
                      },
                      icon: Icon(Icons.arrow_upward),
                    ),
                    Text("Grow"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
