import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        gradient:  LinearGradient(
          colors: [
            Colors.white,
            const Color(0xff02CEDF).withOpacity(0.3),
            const Color(0xffbfe9ff),
            Colors.white
          ],
          stops: [1,0, 1,1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Copy Right @2024',style: TextStyle(color: Colors.black45)),
          Text('Project Participants : Amr Hossam , Sara Mohameed , Rana Hossam',style: TextStyle(color: Colors.black87),),

        ],
      ),
    );
  }
}
