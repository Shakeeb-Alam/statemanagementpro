import 'package:flutter/material.dart';
import 'package:get/get.dart';
class getmaterial extends StatefulWidget {
  const getmaterial({super.key});

  @override
  State<getmaterial> createState() => _getmaterialState();
}

class _getmaterialState extends State<getmaterial> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(('GetMaterial')),),
      body: Column(
        children: [

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.snackbar('Get X', 'Blocship');
        }
      ),
    );
  }
}
