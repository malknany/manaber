import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/profile_pationt/video/cubit/video_play_cubit.dart';
import 'package:manaber/shared/styles/styles.dart';
import '../../../../../shared/components/components.dart';
import '../../../../../shared/styles/colors.dart';

class SlectedVideo extends StatefulWidget {
  const SlectedVideo({super.key, required this.id});
  final String id;
  @override
  State<SlectedVideo> createState() => _SlectedVideoState();
}

class _SlectedVideoState extends State<SlectedVideo> {
  bool isSlected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, 'refrech');
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: Text(
          "Select video",
          style: AppTextStyles.smTitles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primarycolor,
          child: const Icon(
            Icons.file_upload_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            // ? this line the user can not send the video more then one
            isSlected
                ? context.read<VideoPlayCubit>().sendVideoToApi(
                    id: widget.id,
                    name: context.read<VideoPlayCubit>().controllertitle.text)
                : null;
            isSlected = false;
          }),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormFiledStepper(
                  textEditingController:
                      context.read<VideoPlayCubit>().controllertitle,
                  labelname: 'Title',
                ),
                BlocBuilder<VideoPlayCubit, VideoPlayState>(
                  builder: (context, state) {
                    if (state is VideoPlaySlected) {
                      isSlected = true;
                      return Text(
                        'تم اختيار الفديو',
                        style: AppTextStyles.lrTitles
                            .copyWith(color: AppColors.primarycolor),
                      );
                    }
                    if (state is VideoPlayInitial) {
                      return ButtonText(
                        text: 'اختار فديو',
                        onPressed: () {
                          context.read<VideoPlayCubit>().slectFromGallary();
                        },
                      );
                    }
                    if (state is VideoPlaySuccess) {
                      return const CircleAvatar(
                        backgroundColor: AppColors.primarycolor,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      );
                    }
                    if (state is VideoPlayLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.primarycolor),
                      );
                    }
                    return SizedBox.fromSize();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// final TextEditingController _controllertitle = TextEditingController();

// bool isSlected = false;
// firebase_storage.UploadTask? uploadTask;

// File? video;

// Future<void> _addVideo() async {
//   final result = await FilePicker.platform.pickFiles(
//     allowMultiple: false,
//     type: FileType.video,
//   );

//   if (result != null) {
//     setState(() {
//       final file = result.files.first;
//       video = File(file.path!);
//       final model = ModelVideoes(
//         tilte: _controllertitle.text,
//         videoFiles: file.path!,
//       );
//       widget.controleViedoes!.listOfViedoes.add(model);
//     });
//   } else {
//     // User canceled the picker
//   }
// }

// Future<String> _uploadImages() async {
//   final counter = DateTime.now();
//   final fileName = '${DateTime.now()}.jpg';
//   final ref = firebase_storage.FirebaseStorage.instance
//       .ref()
//       .child("media")
//       .child('video')
//       .child('vids$counter')
//       .child(_controllertitle.text)
//       .child(fileName);

//   setState(() {
//     uploadTask = ref.putFile(video!);
//   });
//   final snapshot = await uploadTask!.whenComplete(() {});
//   final downloadUrl = await snapshot.ref.getDownloadURL();
//   print("length==================${downloadUrl.length}");
//   print("length==================${downloadUrl}");

//   setState(() {
//     uploadTask = null;
//   });
//   return downloadUrl;
// }

// StreamBuilder<firebase_storage.TaskSnapshot>(
//   stream: state.uploadTask!.snapshotEvents,
//   builder: (context, snapshot) {
//     if (snapshot.hasData) {
//       final data = snapshot.data!;
//       double progress =
//           data.bytesTransferred / data.totalBytes;
//       return SizedBox(
//         height: 50,
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             LinearProgressIndicator(
//               backgroundColor: AppColors.grey,
//               value: progress,
//               color: AppColors.primarycolor,
//             ),
//             Center(
//               child: Text(
//                 "${(progress * 100).roundToDouble()}",
//                 style: AppTextStyles.lrTitles
//                     .copyWith(color: Colors.white),
//               ),
//             )
//           ],
//         ),
//       );
//     } else {
//       return const SizedBox(
//         height: 50,
//       );
//     }
//   },
// );
