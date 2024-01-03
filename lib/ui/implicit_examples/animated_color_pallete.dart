import 'dart:math';

import 'package:animation/ui/implicit_examples/animated_shopping_cart_button.dart';
import 'package:flutter/material.dart';

class AnimatedColorPalette extends StatefulWidget {
  const AnimatedColorPalette({super.key});

  @override
  State<AnimatedColorPalette> createState() => _AnimatedColorPaletteState();
}

class _AnimatedColorPaletteState extends State<AnimatedColorPalette> {
  List<Color> currentPalette = generateRandomPalette();

  static List<Color> generateRandomPalette() {
    final random = Random();
    return List.generate(
      5,
      (_) => Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      ),
    );
  }

  void regeneratePalette() {
    setState(() {
      currentPalette = generateRandomPalette();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (Color color in currentPalette)
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 100,
                height: 100,
                color: color,
                margin: const EdgeInsets.all(8),
              ),
            ElevatedButton(
              onPressed: regeneratePalette,
              child: const Text('Generate New Palette'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShoppingCartButton(),
                  )),
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
