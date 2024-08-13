import 'package:flutter/material.dart';

class TrustedWidget extends StatelessWidget {
  const TrustedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xff00c9ff).withOpacity(0.3), const Color(0xff92fed3).withOpacity(0.3), const Color(0xffffffff).withOpacity(0.3)],
          stops: const [0, 1, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3,),
              const Text('Trusted in productions for  :',style: TextStyle(color:Color(0xff263238),fontSize: 25,fontWeight: FontWeight.bold),),
              const Spacer(flex: 2,),
              Image.asset('Assets/images/logo1.png',width:60,height: 60,),
              const Spacer(flex: 1,),
              Image.asset('Assets/images/logo2.png',width:100,height: 90),
              const Spacer(flex: 1,),
              Image.asset('Assets/images/logo3.png',width:100,height: 90),
              const Spacer(flex: 3,),
            ],
          ),
          const SizedBox(height: 50,),
          const Row(
            children: [
              Spacer(flex: 2,),
              Column(
                children: [
                  Text('Remarkably accurate',style: TextStyle(color:Color(0xff263238),fontSize: 20,fontWeight: FontWeight.bold),),
                  Text('AI model trained over one million image',style: TextStyle(color:Colors.black45,fontSize: 14,fontWeight: FontWeight.bold),),
                ],
              ),
              Spacer(flex: 1,),
              Column(
                children: [
                  Text('World’s best AI to color B&W photos',style: TextStyle(color: Color(0xff263238),fontSize: 20,fontWeight: FontWeight.bold),),
                  Text('Thousands of users daily',style: TextStyle(color:Colors.black45,fontSize: 14,fontWeight: FontWeight.bold),),
                ],
              ),
              Spacer(flex: 1,),
              Column(
                children: [
                  Text('In a league of its own',style: TextStyle(color: Color(0xff263238),fontSize: 20,fontWeight: FontWeight.bold),),
                  Text('Instant photo colorizing',style: TextStyle(color:Colors.black45,fontSize: 14,fontWeight: FontWeight.bold),),

                ],
              ),
              Spacer(flex: 2,),

            ],
          )
        ],
      ),
    );
  }
}
