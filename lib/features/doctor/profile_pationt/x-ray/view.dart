// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'dart:io';

// import 'package:manaber/shared/styles/colors.dart';

// class GalleryScreen extends StatefulWidget {
//   @override
//   _GalleryScreenState createState() => _GalleryScreenState();
// }

// class _GalleryScreenState extends State<GalleryScreen> {
//   List<File> _images = [];

//   Future pickImages() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.image,
//       allowMultiple: true,
//     );

//     if (result != null) {
//       setState(() {
//         _images = result.paths.map((path) => File(path!)).toList();
//       });
//     } else {
//       // User canceled the picker
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//           onPressed: pickImages, backgroundColor: AppColors.primarycolor),
//       appBar: AppBar(
//         title: Text('Gallery Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _images.isEmpty
//                 ? Text('No images selected.')
//                 : Expanded(
//                     child: GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3,
//                         crossAxisSpacing: 4,
//                         mainAxisSpacing: 4,
//                       ),
//                       itemCount: _images.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Image.file(
//                           _images[index],
//                           fit: BoxFit.cover,
//                         );
//                       },
//                     ),
//                   ),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
