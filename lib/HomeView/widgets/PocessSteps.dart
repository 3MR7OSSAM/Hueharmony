import 'package:flutter/material.dart';

import 'AnimatedText.dart';

class StepWidget extends StatelessWidget {
  final int stepNumber;
  final String stepDescription;

  StepWidget({required this.stepNumber, required this.stepDescription});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Text('$stepNumber',style: const TextStyle(color:Color(0xff263238),fontSize: 24,fontWeight: FontWeight.bold),), // Customize the color as needed
          ),
          const SizedBox(height: 8), // Spacer
          Text(
            stepDescription,
            style: const TextStyle(color:Color(0xff263238),fontSize: 18,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ProcessSteps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child:Text('Start Using : ',style: const TextStyle(color:Color(0xff263238),fontSize: 24,fontWeight: FontWeight.bold),),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StepWidget(
              stepNumber: 1,
              stepDescription: 'Step 1 :\n Select an image from your device.',
            ),
            StepWidget(
              stepNumber: 2,
              stepDescription: 'Step 2 :\n Upload the selected image.',
            ),
            StepWidget(
              stepNumber: 3,
              stepDescription: 'Step 3 :\n Download the processed image.',
            ),
          ],
        ),
      ],
    );
  }
}

