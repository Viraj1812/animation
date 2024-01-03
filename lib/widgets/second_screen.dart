import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;

  var listRadius = [150.0, 200.0, 250.0, 300.0, 350.0];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 4), lowerBound: 0.3);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            buildMyContainer(listRadius[0]),
            buildMyContainer(listRadius[1]),
            buildMyContainer(listRadius[2]),
            buildMyContainer(listRadius[3]),
            buildMyContainer(listRadius[4]),
            const Icon(
              Icons.call,
              color: Colors.white,
              size: 64,
            ),
          ],
          /* 
            listRadius
                .map((e) => Container(
                      width: e * _animation.value,
                      height: e * _animation.value,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              Colors.blue.withOpacity(1.0 - _animation.value)),
                    ))
                .toList()
            */

          // [
          //   ListView.builder(
          //     itemCount: listRadius.length,
          //     itemBuilder: (context, index) => Container(
          //       width: listRadius[index] * _animation.value,
          //       height: listRadius[index] * _animation.value,
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: Colors.blue.withOpacity(1.0 - _animation.value),
          //       ),
          //     ),
          //   ),
          // ],
        ),
      ),
    );
  }

  Widget buildMyContainer(e) {
    return Container(
      width: e * _animation.value,
      height: e * _animation.value,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.withOpacity(1.0 - _animation.value)),
    );
  }
}
