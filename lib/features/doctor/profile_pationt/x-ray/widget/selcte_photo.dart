// // import 'dart:io';

// // import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:manaber/features/doctor/profile_pationt/x-ray/cubit/xray_cubit.dart';

// import '../../../../../shared/components/components.dart';
// import '../../../../../shared/styles/colors.dart';

// class SlectePhotoView extends StatefulWidget {
//   const SlectePhotoView({super.key, required this.id});
//   // final ControleXray controle;
//   final String id;

//   @override
//   State<SlectePhotoView> createState() => _SlectePhotoViewState();
// }

// class _SlectePhotoViewState extends State<SlectePhotoView> {
//   // List<File> _images = [];
//   bool isDeleted = false;
//   bool isSlected = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           isSlected
//               ? context.read<XrayCubit>().sendImagesToApi(
//                     id: widget.id,
//                   )
//               : null;

//           isSlected = false;
//         },
//         backgroundColor: AppColors.primarycolor,
//         child: const Icon(
//           Icons.upload,
//         ),
//       ),
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context, 'refrech');
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios_new,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               setState(() {
//                 isDeleted = !isDeleted;
//               });
//             },
//             icon: const Icon(
//               Icons.delete,
//             ),
//           )
//         ],
//         title: const Text('Gallery Screen'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             BlocBuilder<XrayCubit, XrayState>(
//               builder: (context, state) {
//                 if (state is XraySelected) {
//                   isSlected = true;
//                   final model = state.images;
//                   return Expanded(
//                     child: GridView.builder(
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 4,
//                         mainAxisSpacing: 4,
//                       ),
//                       itemCount: model.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Stack(
//                           children: [
//                             Image.file(
//                               model[index],
//                               fit: BoxFit.fill,
//                               errorBuilder: (context, error, stackTrace) {
//                                 return Container(
//                                   color: AppColors.primarycolor,
//                                   child: const Center(
//                                     child: Text(
//                                       'Error load image',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                             isDeleted
//                                 ? Align(
//                                     alignment: Alignment.topRight,
//                                     child: IconButton(
//                                       onPressed: () {
//                                         setState(() {
//                                           model.removeAt(index);
//                                         });
//                                       },
//                                       icon: const Icon(
//                                         Icons.delete,
//                                         color: Colors.red,
//                                       ),
//                                     ),
//                                   )
//                                 : const SizedBox.shrink()
//                           ],
//                         );
//                       },
//                     ),
//                   );
//                 }
//                 if (state is XrayInitial) {
//                   return ButtonText(
//                     text: 'Selcte photo',
//                     onPressed: () {
//                       context.read<XrayCubit>().pickImages();
//                     },
//                   );
//                 }
//                 if (state is XrayLoading) {
//                   return const Center(
//                     child: CircularProgressIndicator(
//                         color: AppColors.primarycolor),
//                   );
//                 }
//                 if (state is XraySuccess) {
//                   return const Center(
//                     child: Icon(
//                       Icons.check_circle,
//                       color: AppColors.primarycolor,
//                     ),
//                   );
//                 }
//                 return const SizedBox.shrink();
//               },
//             ),
//             // _images.isNotEmpty
//             //     ? Expanded(
//             //         child: GridView.builder(
//             //           gridDelegate:
//             //               const SliverGridDelegateWithFixedCrossAxisCount(
//             //             crossAxisCount: 2,
//             //             crossAxisSpacing: 4,
//             //             mainAxisSpacing: 4,
//             //           ),
//             //           itemCount: _images.length,
//             //           itemBuilder: (BuildContext context, int index) {
//             //             return InkWell(
//             //               onLongPress: (){
//             //                 showMenu(context: context, position: const RelativeRect.fromLTRB(0, 0, 0, 0), items: []);
//             //               },
//             //               child: Image.file(
//             //                 _images[index],
//             //                 fit: BoxFit.fill,
//             //               ),
//             //             );
//             //           },
//             //         ),
//             //       )
//             //     : SizedBox.fromSize(),
//           ],
//         ),
//       ),
//     );
//   }
// }
