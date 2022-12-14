import 'dart:io';

import 'package:camera/imageModel.dart';
import 'package:camera/list.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
File? _image;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  Future pickImage() async{
    var _image = await ImagePicker().pickImage(source: ImageSource.camera);
    if(_image == null) return;

    final imageTemporary = File(_image.path);
    final data = ImageModel(img: imageTemporary);
    addImage(data);
    setState(() => _image = imageTemporary as XFile?);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),

            _image!=null ? Image.file(_image!,width: 100,height: 100,fit: BoxFit.cover,) : Image.network('https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png'),

            const SizedBox(height: 50,),
            ElevatedButton(
              onPressed: (){
                pickImage();
              }, 
              child: const Text('Camera'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: ((context)=>const CameraList()),
                  ),
                );
              }, 
              child: const Text('Gallery '),
            ),  
          ],
        ),
      ),
    );
  }
}