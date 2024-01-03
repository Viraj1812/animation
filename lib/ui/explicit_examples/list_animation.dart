import 'package:animation/ui/explicit_examples/loading_animation.dart';
import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late List<Animation<Offset>> animations = [];
  final int itemCount = 5;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    animations = List.generate(
      itemCount,
      (index) =>
          Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            index * (1 / itemCount),
            1,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Animation'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RadialProgressAnimation(
                      progress: 1, color: Colors.blue),
                )),
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: animations[index],
            child: ListTile(
              title: Text('Hello World, Rivaan. ${index.toString()}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.isCompleted) {
            controller.reverse();
          } else {
            controller.forward();
          }
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
