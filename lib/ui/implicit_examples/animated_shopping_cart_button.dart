import 'package:animation/ui/implicit_examples/animated_tween_animation_builder_example.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => setState(() {
                isExpanded = !isExpanded;
              }),
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: isExpanded ? 200.0 : 150.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: isExpanded ? Colors.green : Colors.blue,
                  borderRadius: BorderRadius.circular(isExpanded ? 30.0 : 10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      isExpanded ? Icons.check : Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    if (isExpanded == true)
                      Text(
                        'Add to Cart!',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PulsatingCircleAnimation(),
                  )),
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
