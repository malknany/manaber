import 'package:flutter/material.dart';
import 'package:manaber/features/file_assa/stpper/controller.dart';
import 'package:manaber/shared/styles/colors.dart';

class FileStteper extends StatefulWidget {
  const FileStteper({super.key});

  @override
  State<FileStteper> createState() => _FileStteperState();
}

class _FileStteperState extends State<FileStteper> {
  final controle = StepperControl();
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'File Assessment',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'Schyler',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        foregroundColor: AppColors.primarycolor,
      ),
      body: Container(
        width: double.infinity,
        child: Theme(
          data: Theme.of(context).copyWith(
              colorScheme:
                  const ColorScheme.light(primary: AppColors.primarycolor)),
          child: SizedBox(
            width: 252,
            child: Stepper(
              physics: const ClampingScrollPhysics(),
              elevation: 0,
              steps: controle.getSteps(),
              currentStep: controle.currentStep,
              type: StepperType.horizontal,
              onStepCancel: () => controle.currentStep == 0
                  ? null
                  : setState(() {
                      controle.currentStep -= 1;
                    }),
              onStepContinue: () async {
                bool isLastStep =
                    (controle.currentStep == controle.getSteps().length - 1);
                if (isLastStep) {
                } else {
                  setState(() {
                    controle.currentStep += 1;
                  });
                }
              },
              onStepTapped: (step) => setState(() {
                controle.currentStep = step;
              }),
              controlsBuilder: (context, details) {
                return Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: Text(
                        controle.currentStep == 4 ? 'Finish' : 'Next',
                        style:
                            const TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    )),
                    if (controle.currentStep != 0)
                      SizedBox(
                        width: 15,
                      ),
                    if (controle.currentStep != 0)
                      Expanded(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: details.onStepCancel,
                        child: Text(
                          'Back',
                          style: TextStyle(
                              fontSize: 13, color: AppColors.primarycolor),
                        ),
                      )),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
// Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           'File Assessment',
//           style: TextStyle(
//             fontSize: 20,
//             color: Colors.white,
//             fontFamily: 'Schyler',
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         foregroundColor: AppColors.primarycolor,
//       ),
//       body: Container(
//         width: double.infinity,
//         child: Theme(
//           data: Theme.of(context).copyWith(
//               colorScheme:
//                   const ColorScheme.light(primary: AppColors.primarycolor)),
//           child: SizedBox(
//             width: 252,
//             child: Stepper(
//               physics: const ClampingScrollPhysics(),
//               elevation: 0,
//               steps: controle.getSteps(),
//               currentStep: controle.currentStep,
//               type: StepperType.horizontal,
//               onStepCancel: () => controle.currentStep == 0
//                   ? null
//                   : setState(() {
//                       controle.currentStep -= 1;
//                     }),
//               onStepContinue: () async {
//                 bool isLastStep =
//                     (controle.currentStep == controle.getSteps().length - 1);
//                 if (isLastStep) {
//                 } else {
//                   setState(() {
//                     controle.currentStep += 1;
//                   });
//                 }
//               },
//               onStepTapped: (step) => setState(() {
//                 controle.currentStep = step;
//               }),
//               controlsBuilder: (context, details) {
//                 return Row(
//                   children: [
//                     Expanded(
//                         child: ElevatedButton(
//                       onPressed: details.onStepContinue,
//                       child: Text(
//                         controle.currentStep == 4 ? 'Finish' : 'Next',
//                         style:
//                             const TextStyle(fontSize: 13, color: Colors.white),
//                       ),
//                     )),
//                     if (controle.currentStep != 0)
//                       SizedBox(
//                         width: 15,
//                       ),
//                     if (controle.currentStep != 0)
//                       Expanded(
//                           child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white),
//                         onPressed: details.onStepCancel,
//                         child: Text(
//                           'Back',
//                           style: TextStyle(
//                               fontSize: 13, color: AppColors.primarycolor),
//                         ),
//                       )),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );