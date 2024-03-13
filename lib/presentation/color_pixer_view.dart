import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:statemanagement/presentation/library.dart';

import '../domain/color_model.dart';
import 'color_screen.dart';

class ColorPickerView extends StatefulWidget {
  const ColorPickerView({super.key});

  @override
  State<ColorPickerView> createState() => _ColorPickerViewState();
}

class _ColorPickerViewState extends State<ColorPickerView> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

  List<Notes> list =[];
  late SharedPreferences sharedPreferences;

  getData() {
    List<String>? stringList = sharedPreferences.getStringList("list");

    if(stringList != null){
      list = stringList.map((item) => Notes.fromMap(json.decode(item))).toList();
    }
  }

  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{

    sharedPreferences = await SharedPreferences.getInstance();
    getData();
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download),
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
              ),
              builder: (BuildContext context) {
                return Container(
                  //decoration: BoxDecoration(),
                  height: 300,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                            // border: Border.all(
                            //   color: Colors.grey[400],
                            // ),
                          ),
                          child:  TextFormField(
                            controller: title,
                            decoration:const InputDecoration(
                              labelText: 'Enter your text',
                              hintText: 'Type something here',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                       const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                            // border: Border.all(
                            //   color: Colors.grey[400],
                            // ),
                          ),
                          child:  TextFormField(
                            controller: description,
                            maxLines: 4,
                            decoration:const InputDecoration(
                              labelText: 'Note..',
                              hintText: 'Type something here',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                       const  SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue,
                              // text color
                              padding:const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              // button padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // button border radius
                              ),
                            ),
                            onPressed: () async{

                              list.insert(0, Notes(

                                  title: title.text,
                                  description: description.text));
                              List<String> stringList = list.map((item) => json.encode(item.toMap())).toList();
                              sharedPreferences.setStringList("list", stringList);

                              Navigator.pop(context, "loadData");
                            },
                            child: const Center(child: Text('save ')))
                      ],
                    ),
                  ),
                );
              });
        },
      ),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context)=> const NotesScreen()));}, icon: const Icon(Icons.save))],
        title:const Center(child: Text("Color Designer")),
      ),
      body: SafeArea(
        child: ColorPickerWidget(),
      ),
    );
  }
}
