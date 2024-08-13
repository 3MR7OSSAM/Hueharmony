import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'CustomButton.dart';

class HomeBanner extends StatelessWidget {
  HomeBanner({
    Key? key,
    this.imageUrl,
  }) : super(key: key);
  final String? imageUrl;
  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.4,
      height: size.width * 0.25,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 400,
                child: Center(
                  child: Image.network(
                    'https://i.ibb.co/smk4GkW/20240511-232455.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            // Visibility(
            //    visible: imageUrl!=null,
            //   child: CustomButton(
            //     label: 'Download',
            //     gradientColors: const [Color(0xff02CEDF)],
            //     onPressed: () async {
            //       if (kDebugMode) {
            //         print(imageUrl);
            //       }
            //       if (await canLaunch(imageUrl!)) {
            //         await launch(imageUrl!,
            //             forceSafariVC: false, forceWebView: false);
            //       } else {
            //         throw 'Could not launch $imageUrl!';
            //       }
            //     },
            //     icon: Icons.download,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
