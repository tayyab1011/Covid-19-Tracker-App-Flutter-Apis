
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});
  @override
  State<StatefulWidget> createState() => _UploadImage();
}

class  _UploadImage extends State<UploadImage> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;
  Future getImage() async{
  final pickedFile = await _picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
  if(pickedFile!=null){
    image=File(pickedFile.path);
    setState(() {

    });
  }
}
Future<void> uploadImage() async{
    setState(() {
      showSpinner =  true;
    });
}

  @override
  Widget build(BuildContext context) {
  return ModalProgressHUD(
    inAsyncCall: showSpinner,
    child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Container(
          child: image==null? const Center(
          child: Text("Pick Image"),):
        Container(

          child: Center(
            child: Image.file(File(image!.path).absolute,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),

          ),
        )
        )
        ],
      ),
    ),
  );
  }
}
