import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: AnimatedContainerScaffold(),
      home: Animations(),
    );
  }
}

class Animations extends StatefulWidget {
  const Animations({
    super.key,
  });

  @override
  State<Animations> createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> {
  var random = Random();
  var opacity = 1.0;
  bool isFirstChildAlive = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 250),
              reverseDuration: const Duration(milliseconds: 500),
              crossFadeState: isFirstChildAlive
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(milliseconds: 250),
                child: Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'This is a text',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              secondChild: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'This is second text',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          AnimatedButton(
            text: opacity == 0 ? 'Show' : 'Fade',
            onTap: () {
              isFirstChildAlive = !isFirstChildAlive;
              //opacity = random.nextDouble();
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  final Function() onTap;
  final String text;
  const AnimatedButton({
    required this.onTap,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  double width = double.maxFinite;
  double height = 60;
  double verticalMargin = 20;
  double horizontalMargin = 20;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        verticalMargin = 30;
        height = 40;
        horizontalMargin = 40;
        setState(() {});

      },
      onTapUp: (_) {
        verticalMargin = 20;
        height = 60;
        horizontalMargin = 20;
        setState(() {});

      },
      onTapCancel: () {
        verticalMargin = 20;
        height = 60;
        horizontalMargin = 20;
        setState(() {});

      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(
          vertical: verticalMargin,
          horizontal: horizontalMargin,
        ),
        width: width,
        height: height,
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}