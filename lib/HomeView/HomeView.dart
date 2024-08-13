import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sams_web/HomeView/widgets/ColoredContainer.dart';
import 'package:sams_web/HomeView/widgets/CustomButton.dart';
import 'package:sams_web/HomeView/widgets/FooterWidget.dart';
import 'package:sams_web/HomeView/widgets/HomeAppBar.dart';
import 'package:sams_web/HomeView/widgets/HomeBanner.dart';
import 'package:sams_web/HomeView/widgets/PocessSteps.dart';
import 'package:sams_web/HomeView/widgets/TrustedWidget.dart';
import 'dart:html' as html;
import 'package:uuid/uuid.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isUploading = false;
  Uint8List? _imageBytes;
  Uint8List webImage = Uint8List(8);
  File? _pickedImage;
  String? imageUrl;
  String? colorizedImageUrl ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: SizedBox(
          height:colorizedImageUrl== '' ? 1140 : 1500,
          child: Column(
            children: [
               const HomeAppBar(),
              // const LandingWidget(),
              // const SizedBox(height: 50,),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient:  LinearGradient(
                    colors: [const Color(0xff00c9ff).withOpacity(0.3), const Color(0xff92fed3).withOpacity(0.3), const Color(0xffffffff).withOpacity(0.3)],
                    stops: const [0, 1, 1],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ProcessSteps(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    width: 500,
                    height: 300,
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(30),
                      color: const   Color(0xff02CEDF),
                      strokeWidth: 2,
                      dashPattern: const [2, 2],
                      child: Container(
                        width: 500,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              const Color(0xff02CEDF).withOpacity(0.3),
                              const Color(0xffbfe9ff),
                              Colors.white
                            ],
                            stops: const [1,0, 1,1],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        ),
                        child: !isUploading? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(height: 20),
                            if (_pickedImage != null)
                              Flexible(
                                child: kIsWeb
                                    ? Image.memory(webImage, fit: BoxFit.fill)
                                    : Image.file(_pickedImage!,
                                        fit: BoxFit.fill),
                              ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Visibility(
                                  visible: _pickedImage== null,
                                  child: CustomButton(
                                    label: 'Pick Image',
                                    icon: Icons.add_circle,
                                    onPressed: _pickImage,
                                    gradientColors:  const [
                                      Color(0xff02CEDF)
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: _pickedImage != null,
                                  child: CustomButton(
                                    label: 'Clear Image',
                                    icon: Icons.remove_circle_outlined,
                                    onPressed: () {
                                      setState(() {
                                        _pickedImage = null;
                                      });
                                    },
                                    gradientColors:  const [
                                      Color(0xff02CEDF)
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: _pickedImage != null,
                                  child: CustomButton(
                                    label: 'Upload Image',
                                    icon: Icons.add_circle,
                                    onPressed: () => uploadFile(_pickedImage!),
                                    gradientColors:  const [
                                      Color(0xff02CEDF)
                                    ],
                                  ),
                                ),

                              ],
                            ),
                            Visibility(
                                visible: _imageBytes == null,
                                child:  const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    'By uploading an image or URL \n you agree to our Terms of Use and Privacy Policy.' ,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff263238),
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ],
                        ): const SizedBox(
                          height: 500,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text('Working on it , Please hold on !'),
                              ),
                              Center(
                                child: CircularProgressIndicator(
                                  color:  Color(0xff02CEDF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                   HomeBanner(),
                  const Spacer(),
                ],
              ),
               Visibility(
                  visible:  colorizedImageUrl!= '',
                  child:ColoredContainer(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Your Image Has Been Processed : ', style: TextStyle(color: Color(0xff263238),fontSize: 16,fontWeight: FontWeight.bold),),
                            ),
                            CustomButton(
                              label: 'Download Now',
                              gradientColors: const [Color(0xff02CEDF)],
                              onPressed: () {
                                html.window.open(colorizedImageUrl!, '_blank');
                              },
                              icon: Icons.download,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width *0.2,
                          height:  MediaQuery.sizeOf(context).width *0.2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16), // Specify the border radius here
                            child: Image.network(
                              colorizedImageUrl!,
                              fit: BoxFit.contain,
                            ),
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('Assets/images/arrow.png',width: 90,),
                        ),
                        imageUrl !=  null? SizedBox(
                          width: MediaQuery.sizeOf(context).width *0.2,
                          height:  MediaQuery.sizeOf(context).width *0.2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16), // Specify the border radius here
                            child: Image.network(
                              imageUrl!,
                              fit: BoxFit.contain,
                            ),
                          ),

                        ):const SizedBox(),
                      ],
                    )
                  )
              ),
              const Spacer(),
              const TrustedWidget(),
              const FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> uploadFile(File? file) async {
    setState(() {
      isUploading = true;
    });

    if (file == null) {
      if (kDebugMode) {
        print('Please select a file to upload');
      }
    } else {
      final uuid = const Uuid().v4();
      try {
        final ref = FirebaseStorage.instance.ref().child('$uuid.jpg');
        if (kIsWeb) {
          await ref.putData(webImage);
        } else {
          await ref.putFile(file);
        }
        imageUrl = await ref.getDownloadURL();

        // Send the image URL to the Flask server
        await _getColorizedImage(imageUrl!);

        if (kDebugMode) {
          print('Image uploaded successfully');
        }
      } on FirebaseException catch (e) {
        if (kDebugMode) {
          print('Firebase Storage Error: $e');
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error uploading file: $e');
        }
      } finally {
        if (kDebugMode) {
          print(imageUrl);
        }
        setState(() {
          _pickedImage = null;
          isUploading = false;
        });
      }
    }
  }

  Future<void> _getColorizedImage(String imageUrl) async {
    try {
      final response = await _sendColorizationRequest(imageUrl);

      if (response.statusCode == 200) {
        _handleSuccessResponse(response);
      } else {
        _handleErrorResponse(response.statusCode);
      }
    } catch (e) {
      _handleException(e);
    }
  }

  Future<http.Response> _sendColorizationRequest(String imageUrl) {
    return http.post(
      Uri.parse('http://127.0.0.1:5000/colorize-image'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'image_url': imageUrl}),
    );
  }

  void _handleSuccessResponse(http.Response response) {
    final responseData = jsonDecode(response.body);
    if (kDebugMode) {
      print('Successfully uploaded image: ${responseData['publicUrl']}');
    }
    setState(() {
      colorizedImageUrl = responseData['publicUrl'];
    });
  }

  void _handleErrorResponse(int statusCode) {
    if (kDebugMode) {
      print('Failed to load image: $statusCode');
    }
  }

  void _handleException(dynamic e) {
    if (kDebugMode) {
      print('Error: $e');
    }
  }
  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        //  showBtmAlert(context, 'please select an image');
      }
    } else if (kIsWeb) {
      final ImagePicker picker0 = ImagePicker();
      XFile? image = await picker0.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        //    showBtmAlert(context, 'please select an image');
      }
    } else {
      // showBtmAlert(context, 'Something went wrong');
    }
  }
}
