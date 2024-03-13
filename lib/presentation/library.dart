import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:statemanagement/presentation/color_screen.dart';

import '../domain/color_model.dart';




class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  List<Notes> list =[];
  late SharedPreferences sharedPreferences;

  getData() async{
    sharedPreferences = await SharedPreferences.getInstance();
    List<String>? stringList = sharedPreferences.getStringList("list");


    print(stringList);

    if(stringList != null){
      list = stringList.map((item) => Notes.fromMap(json.decode(item))).toList();
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
        title: const Text("Notes"),
      ),

      body: list.isEmpty?
      const Center(child: Text("Empty"),):

      ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index){
            return
              ListTile(
              leading: CircleAvatar(
                child: Text('$index'),
              ),
              title: Text(list[index].title),
              subtitle: Text(list[index].description),

              // trailing: IconButton(
              //     onPressed: (){
              //       setState(() {
              //         list.remove(list[index]);
              //         List<String> stringList = list.map((item) => json.encode(item?.toMap())).toList();
              //         sharedPreferences.setStringList("list", stringList);
              //       });
              //     },
              //     icon: const Icon(Icons.delete_forever_outlined)),
            );
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
