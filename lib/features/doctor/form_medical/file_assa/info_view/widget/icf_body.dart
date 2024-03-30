import 'package:flutter/material.dart';
import '../../../model.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../../../../../../shared/styles/images.dart';

// class ICFBodyView extends StatelessWidget {
//   const ICFBodyView({
//     super.key,
//     required this.iCFBodyFunction,
//   });

//   final List<ModelPatientInfo> iCFBodyFunction;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text('Body function',
//             style: TextStyle(
//               color: AppColors.primaryColor,
//             )),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
//         child: ListView(
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             SizedBox(
//                 width: double.infinity,
//                 height: MediaQuery.of(context).size.height / 3.5,
//                 child: Image.asset(AppImages.fileAssessment)),
//             const Text(
//               "File Assessment",
//               style: TextStyle(
//                   fontSize: 22,
//                   color: Colors.black,
//                   fontFamily: 'Schyler',
//                   fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               "All information about Patient",
//               style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                   fontFamily: 'Schyler',
//                   fontWeight: FontWeight.normal),
//             ),
//             const SizedBox(height: 16.0),
//             Expanded(
//               child: ListView.separated(
//                 separatorBuilder: (context, index) {
//                   if (index == 3) {
//                     return const Text(
//                       'Sensory Examination',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     );
//                   }
//                   if (index == 8) {
//                     return const Text(
//                       'GaiT Problems',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     );
//                   }
//                   if (index == 11) {
//                     return const Text(
//                       'Developmental Milestones',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     );
//                   }
//                   if (index == 19) {
//                     return const Text(
//                       'Neurological Examination',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     );
//                   }
//                   if (index == 22) {
//                     return const Text(
//                       'Primitive Reflexese',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     );
//                   }
//                   if (index == 33) {
//                     return const Text(
//                       'Advanced Reflex',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     );
//                   }
//                   if (index == 35) {
//                     return const Text(
//                       'Muscle strength',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     );
//                   }
//                   if (index == 55) {
//                     return const Text(
//                       'Muscle',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     );
//                   }
//                   if (index == 74) {
//                     return const Text(
//                       'Level of Selectivity',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     );
//                   }
//                   if (index == 76) {
//                     return const Text(
//                       'Muscle',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     );
//                   }
//                   if (index == 101) {
//                     return const Text(
//                       'Rom',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     );
//                   }
//                   if (index == 94) {
//                     return const Text(
//                       'Posture And Alignment',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     );
//                   }
//                   if (index == 99) {
//                     return const Text(
//                       'Hip',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     );
//                   }
//                   return const SizedBox.shrink();
//                 },
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: iCFBodyFunction.length,
//                 itemBuilder: (context, index) {
//                   if (iCFBodyFunction[index].type == 'right_left') {
//                     return RowItemRightLeft(
//                       right: iCFBodyFunction[index].right.toString(),
//                       left: iCFBodyFunction[index].left.toString(),
//                       title: iCFBodyFunction[index].question!,
//                     );
//                   }
//                   return InfoRowItem(
//                       title: iCFBodyFunction[index].question!,
//                       value: iCFBodyFunction[index].answer ?? '');
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ICFBodyView extends StatelessWidget {
  const ICFBodyView({
    Key? key,
    required this.iCFBodyFunction,
  }) : super(key: key);

  final List<ModelPatientInfo> iCFBodyFunction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Body function',
          style: TextStyle(color: AppColors.primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3.5,
                child: Image.asset(AppImages.fileAssessment),
              ),
              const Text(
                "File Assessment",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontFamily: 'Schyler',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "All information about Patient",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'Schyler',
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 16.0),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: List.generate(iCFBodyFunction.length, (index) {
                  if (index == 3 ||
                      index == 8 ||
                      index == 11 ||
                      index == 19 ||
                      index == 22 ||
                      index == 33 ||
                      index == 35 ||
                      index == 55 ||
                      index == 74 ||
                      index == 76 ||
                      index == 94 ||
                      index == 99 ||
                      index == 101) {
                    return Text(
                      iCFBodyFunction[index].question!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else {
                    if (iCFBodyFunction[index].type == 'right_left') {
                      return RowItemRightLeft(
                        right: iCFBodyFunction[index].right.toString(),
                        left: iCFBodyFunction[index].left.toString(),
                        title: iCFBodyFunction[index].question!,
                      );
                    } else {
                      return InfoRowItem(
                        title: iCFBodyFunction[index].question!,
                        value: iCFBodyFunction[index].answer ?? '',
                      );
                    }
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
