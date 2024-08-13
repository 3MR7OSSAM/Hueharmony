import 'package:flutter/material.dart';

class ColoredContainer extends StatelessWidget {
  const ColoredContainer({
    super.key, required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xff00c9ff).withOpacity(0.3), const Color(0xff92fed3).withOpacity(0.3), const Color(0xffffffff).withOpacity(0.3)],
          stops: const [0, 1, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child:child,
    );
  }
}
