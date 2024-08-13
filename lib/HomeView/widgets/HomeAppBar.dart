import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,

  });

  final TextStyle style = const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black,decoration: TextDecoration.underline);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
         height: 80,
        width: double.infinity,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [

              SizedBox(
                  width: 220,
                  height: 220,
                  child: Image.asset('Assets/images/app_logo.png',)),
              const Spacer(flex: 20,),
             const SizedBox(
               width: 300,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text('Home',style: TextStyle(fontSize: 16),),
                   Text('Upload',style: TextStyle(decoration: TextDecoration.underline ,color: Colors.cyan,fontWeight: FontWeight.bold,decorationColor: Colors.cyan ,fontSize: 16),),
                   Text('Profile',style: TextStyle(fontSize: 16)),
                 ],
               ),
             ),
              const SizedBox(width: 90,),
              const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xffEC407A),
                child: Text('A',style: TextStyle(color: Colors.white),),
              ),

              InkWell(
                onTap: ()async{
                  const url = 'http://localhost/hueharmony/';
                  try {
                    if (await canLaunch(url)) {
                      window.location.replace(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  } on Exception catch (e) {
                    // TODO
                  }

                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.logout,size: 20,color:  Color(0xff263238),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
