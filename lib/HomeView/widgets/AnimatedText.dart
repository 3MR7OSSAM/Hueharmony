import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:flutter_animate/flutter_animate.dart';
class AnimatedTitle extends StatelessWidget {
  const AnimatedTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {

    return // rainbow text
      GradientAnimationText(
        text: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
        colors:  [
          Color(0xff01EAFE),
          Color(0xffCF63FE),
          Color(0xffFDB34A),
        ],
        duration: const Duration(seconds: 5),
      );
  }
}
