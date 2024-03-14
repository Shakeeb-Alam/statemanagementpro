import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../domain/color_model.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Notes> list = [];
  late SharedPreferences sharedPreferences;

  getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    List<String>? stringList = sharedPreferences.getStringList("list");
    print(stringList);
    if (stringList != null) {
      list =
          stringList.map((item) => Notes.fromJson(json.decode(item))).toList();
    }

    setState(() {
      list;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Library"),
      ),

      body: list.isEmpty
          ? const Center(
              child: Text("Empty"),
            )
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(4, 4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(2),
                  // ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromRGBO(
                            list[index].redValue.toInt(),
                            list[index].greenValue.toInt(),
                            list[index].blueValue.toInt(),
                            list[index].opacityValue.toDouble()),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list[index].title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(list[index].description),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('R: ${list[index].redValue.toInt()}'),
                          Text('G: ${list[index].greenValue.toInt()}'),
                          Text('B: ${list[index].blueValue.toInt()}'),
                          Text('A: ${(list[index].opacityValue.toInt() / 100).toStringAsFixed(1) }'),
                        ],

                      ),
                      SizedBox(width: 8,),
                    ],
                  ),
                );

                //   ListTile(
                //
                //   leading: CircleAvatar(
                //     child: Text('$index'),
                //   ),
                //   trailing:  Column(
                //     children: [
                //       Text('Red: ${list[index].redValue.toInt()}'),
                //       Text('Green: ${list[index].greenValue.toInt()}'),
                //       Text('Blue: ${list[index].blueValue.toInt()}'),
                //       Text('Opacity: ${list[index].opacityValue.toInt()}'),
                //     ],
                //   ),
                //   title: Text(list[index].title),
                //   subtitle: Text(list[index].description),
                //
                //   // trailing: IconButton(
                //   //     onPressed: (){
                //   //       setState(() {
                //   //         list.remove(list[index]);
                //   //         List<String> stringList = list.map((item) => json.encode(item?.toMap())).toList();
                //   //         sharedPreferences.setStringList("list", stringList);
                //   //       });
                //   //     },
                //   //     icon: const Icon(Icons.delete_forever_outlined)),
                // );
              }),

      // floatingActionButton: FloatingActionButton(
      //     child: const Icon(Icons.add),
      //     onPressed: ()async {
      //       String refresh = await Navigator.push(context, MaterialPageRoute(builder: (context)=> ColorPickerWidget()));
      //       if(refresh == "loadData"){
      //         setState(() {
      //           getData();
      //         });
      //       }
      //     }),
    );
  }
}
// class LibraryScreen extends StatefulWidget {
//   const LibraryScreen({super.key});
//
//   @override
//   State<LibraryScreen> createState() => _LibraryScreenState();
// }
//
// class _LibraryScreenState extends State<LibraryScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(child: Text('Library')),
//       ),

// body: Card(
//   elevation: 4, // Elevation of the card
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(10), // Border radius of the card
//   ),
//   child: const Column(
//     children: [
//       SizedBox(
//         height: 10,
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           CircleAvatar(backgroundColor: Colors.grey),
//           Column(
//             children: [Text('Color Name')],
//           ),
//           Column(
//             children: [Text('R:255')],
//           )
//         ],
//       )
//     ],
//   ),
// ),
//     );
//   }
// }

//
// class LibraryScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Next Screen'),
//         ),
//         body: Center(
//         child: FutureBuilder<String>(
//         future: SharedPreferences.getInstance().then((prefs) => prefs.getString('dataKey')),
//     builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//     return CircularProgressIndicator();
//     } else if (snapshot.hasError) {
//     return Text('Error: ${snapshot.error}');
//     } else {
//     return Text('Stored Data: ${snapshot.data}');
//     }
//     },
//     ),
