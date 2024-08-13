import 'package:flutter/material.dart';
import 'package:sams_web/HomeView/widgets/AnimatedText.dart';

class LandingWidget extends StatelessWidget {
  const LandingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( 'Adding Life to Memories:\nColorize Your Black and White Photos!',style: TextStyle(color:  Color(0xff00c8ce),fontSize: 40,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
            Text( 'Revitalize Your History with Vibrant Color:\nTransform Your Black and White Photos into Timeless Masterpieces!',style: TextStyle(color:  Color(0xff263238),fontSize: 18),textAlign: TextAlign.left,),
          ],
        ),
        Image.asset('Assets/images/Artist-cuate.png',width: 600,)
      ],
    );
  }
}
