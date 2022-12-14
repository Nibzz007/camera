import 'package:camera/imageModel.dart';
import 'package:flutter/material.dart';

class CameraList extends StatefulWidget {
  const CameraList({super.key});

  @override
  State<CameraList> createState() => _CameraListState();
}

class _CameraListState extends State<CameraList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      appBar: AppBar(
        title: Text('Gallery'),
        centerTitle: true,
        backgroundColor: Colors.tealAccent.shade700,
      ),
      body: ValueListenableBuilder(
        valueListenable: imageListNotifier,
        builder: (context, value, child) {
         return ListView.separated(
          itemBuilder: (context,index){
            final data1 = value[index];
            return Container(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.file(data1.img, width: 100, height: 100,),
                    ),
                ],
              ),
            );
          }, 
          separatorBuilder: (context,index){
            return Divider();
          }, 
          itemCount: value.length
          ); 
        }
      ),
    );
  }
}