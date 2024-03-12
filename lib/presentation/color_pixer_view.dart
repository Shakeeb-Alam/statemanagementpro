import 'package:flutter/material.dart';
import 'package:statemanagement/presentation/library.dart';

import 'color_screen.dart';

class ColorPickerView extends StatelessWidget {
  const ColorPickerView({super.key});

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
                          child: const TextField(
                            decoration: InputDecoration(
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
                          child: const TextField(
                            maxLines: 4,
                            decoration: InputDecoration(
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
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LibraryScreen()));
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
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.save))],
        title: Center(child: Text("Color Designer")),
      ),
      body: SafeArea(
        child: ColorPickerWidget(),
      ),
    );
  }
}
