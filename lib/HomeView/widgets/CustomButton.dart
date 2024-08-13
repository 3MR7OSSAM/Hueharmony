import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.label, required this.icon, required this.onPressed, required this.gradientColors}) : super(key: key);
  final  String label;
  final IconData? icon;
  final VoidCallback onPressed;
  final List<Color> gradientColors;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onPressed,
        hoverColor: Colors.white,

        child: Container(
          width: 190,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: gradientColors,
              stops: const [ 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,

            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 5),
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
