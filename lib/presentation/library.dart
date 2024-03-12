import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Library')),
      ),
      body: Card(
        elevation: 4, // Elevation of the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Border radius of the card
        ),
        child: const Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(backgroundColor: Colors.grey),
                Column(
                  children: [Text('Color Name')],
                ),
                Column(
                  children: [Text('R:255')],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
