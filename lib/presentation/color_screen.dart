import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hsv_color_pickers/hsv_color_pickers.dart';

class ColorPickerWidget extends StatefulWidget {
  @override
  _ColorPickerWidgetState createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  double redValue = 0;
  double greenValue = 0;
  double blueValue = 0;
  double greyValue = 0;

  Color getColor() {
    return Color.fromRGBO(
      redValue.toInt(),
      greenValue.toInt(),
      blueValue.toInt(),
      // greyValue.toInt(),
      1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 120,
          backgroundColor: getColor(),
        ),
        const SizedBox(height:10 ,),
        const Padding(
          padding: const EdgeInsets.all(10 ),
          child: Text('You can customize the following Sliders to view the changes render on the color pallete above '),
        ),

        const Padding(
          padding:  EdgeInsets.all(10),
          child: Text('You can use the save button to save your background color'),
        ),
        SizedBox(height: 10),
        // Text('Red: ${redValue.toInt()}'),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.red,
              ),
            ),
            Expanded(
              flex: 3,
              child: Slider(
                value: redValue,
                activeColor: Colors.red,
                onChanged: (newValue) {
                  setState(() {
                    redValue = newValue;
                  });
                },
                min: 0,
                max: 255,
                divisions: 255,
                label: redValue.round().toString(),
              ),
            ),
          ],
        ),
       SizedBox(height: 10,),
        Row(
          children: [
           const Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.green,
              ),
            ),
            Expanded(
              flex: 3,
              child: Slider(
                value: greenValue,
                activeColor: Colors.green,
                onChanged: (newValue) {
                  setState(() {
                    greenValue = newValue;
                  });
                },
                min: 0,
                max: 255,
                divisions: 255,
                label: greenValue.round().toString(),
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
           const Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
              ),
            ),
            Expanded(
              flex: 3,
              child: Slider(
                value: blueValue,
                activeColor: Colors.blue,
                onChanged: (newValue) {
                  setState(() {
                    blueValue = newValue;
                  });
                },
                min: 0,
                max: 255,
                divisions: 255,
                label: blueValue.round().toString(),
              ),
            ),
          ],
        ),

      ],
    );
  }
}
// void main() {
//   runApp(const ExampleApp());
// }
//
// class ExampleApp extends StatefulWidget {
//   const ExampleApp({Key? key}) : super(key: key);
//
//   @override
//   _ExampleAppState createState() => _ExampleAppState();
// }
//
// class _ExampleAppState extends State<ExampleApp> {
//   @override
//   Widget build(BuildContext context) {
// return MaterialApp(
//   // theme: ThemeData(
//   //   primarySwatch: Colors.blue,
//   // ),
//   home: Scaffold(
//       appBar: AppBar(
//         title: const Text("HSV Colors Pickers"),
//       ),
//       body: const Column(
//         children: [
//           Expanded(
//             child: InitialColorExample(),
//           ),
//           Divider(thickness: 2),
//           // Expanded(
//           //   child: ControllerExample(),
//           // ),
//         ],
//       )),
// );
//   }
// }
//
// class InitialColorExample extends StatefulWidget {
//   const InitialColorExample({Key? key}) : super(key: key);
//
//   @override
//   State<InitialColorExample> createState() => _InitialColorExampleState();
// }
//
// class _InitialColorExampleState extends State<InitialColorExample> {
//   Color _color = Colors.green;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         // Text(
//         //   "Example using initialColor",
//         //   style: Theme.of(context).textTheme.titleLarge,
//         // ),
//         CircleAvatar(
//           radius: 100,
//           backgroundColor: _color,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: HuePicker(
//             initialColor: HSVColor.fromColor(_color),
//             onChanged: (color) {
//               setState(() {
//                 _color = color.toColor();
//               });
//             },
//             thumbShape: const HueSliderThumbShape(
//               color: Colors.white,
//               borderColor: Colors.black,
//               filled: false,
//               showBorder: true,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class ControllerExample extends StatefulWidget {
//   const ControllerExample({Key? key}) : super(key: key);
//
//   @override
//   State<ControllerExample> createState() => _ControllerExampleState();
// }

// class _ControllerExampleState extends State<ControllerExample> {
//   late HueController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = HueController(HSVColor.fromColor(Colors.green));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Text(
//           "Example using controller",
//           style: Theme.of(context).textTheme.titleLarge,
//         ),
//         CircleAvatar(
//           radius: 32,
//           backgroundColor: _controller.value.toColor(),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: HuePicker(
//             controller: _controller,
//             onChanged: (color) {
//               setState(() {
//                 // Intentionally left empty, to trigger re-build of Widget
//               });
//             },
//             thumbShape: const HueSliderThumbShape(
//               color: Colors.white,
//               borderColor: Colors.black,
//               filled: false,
//               showBorder: true,
//             ),
//           ),
//         ),
//         ElevatedButton(
//             onPressed: () {
//               _controller.value = HSVColor.fromColor(Colors.blue);
//             },
//             child: const Text("Reset to blue form outside"))
//       ],
//     );
//   }
// }
//
