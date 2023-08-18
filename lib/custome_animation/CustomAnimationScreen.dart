import 'package:flutter/material.dart';

class CustomAnimationDemo extends StatefulWidget {
  const CustomAnimationDemo({super.key});

  @override
  State<CustomAnimationDemo> createState() => _CustomAnimationDemoState();
}

class _CustomAnimationDemoState extends State<CustomAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this, // TickerProvider for the AnimationController
      duration: const Duration(seconds: 2), // Animation duration
    );

    // Start the animation
    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose(); // Don't forget to dispose the AnimationController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Animation Demo'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * 3.14, // Custom animation logic
              child: const FlutterLogo(size: 100),
            );
          },
        ),
      ),
    );
  }
}
