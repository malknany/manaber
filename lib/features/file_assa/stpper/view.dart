import 'package:flutter/material.dart';
import 'package:manaber/features/file_assa/stpper/controller.dart';
import 'package:manaber/shared/styles/colors.dart';

class FileStteper extends StatefulWidget {
  const FileStteper({Key? key}) : super(key: key);

  @override
  State<FileStteper> createState() => _FileStteperState();
}

class _FileStteperState extends State<FileStteper> {
  final controle = StepperControl();
  // int _currentStep = 0;
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
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SizedBox(
          width: double.infinity,
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme:
                    const ColorScheme.light(primary: AppColors.primarycolor)),
            child: Stepper(
              physics: const ClampingScrollPhysics(),
              elevation: 0,
              steps: controle.getSteps(),
              currentStep: controle.currentStep,
              type: StepperType.vertical,
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
                        controle.currentStep == 9 ? 'Finish' : 'Next',
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
// import 'package:flutter/material.dart';
// import 'package:manaber/features/file_assa/stpper/controller.dart';
// import 'package:manaber/shared/styles/colors.dart';

// class FileStteper extends StatefulWidget {
//   const FileStteper({super.key});

//   @override
//   State<FileStteper> createState() => _FileStteperState();
// }

// class _FileStteperState extends State<FileStteper> {
//   final controle = StepperControl();
//   int activeStep = 0;
//   int currentStep = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//           child: Stepper(
//             physics: const ClampingScrollPhysics(),
//             elevation: 0,
//             steps: [
//               //Patient Information
//               Step(
//                 state: currentStep > 0 ? StepState.complete : StepState.indexed,
//                 isActive: currentStep >= 0,
//                 title: const Text(
//                   '',
//                 ),
//                 content: Container(),
//               ),
//               Step(
//                 state: currentStep > 1 ? StepState.complete : StepState.indexed,
//                 isActive: currentStep >= 1,
//                 //ICF Body function And structure
//                 title: const Text(
//                   '',
//                 ),
//                 content: Container(),
//               ),
//               Step(
//                 state: currentStep > 2 ? StepState.complete : StepState.indexed,
//                 isActive: currentStep >= 2,
//                 //Neurological Examination
//                 title: const Text(
//                   '',
//                 ),
//                 content: Container(),
//               ),
//               Step(
//                 state: currentStep > 3 ? StepState.complete : StepState.indexed,
//                 isActive: currentStep >= 3,
//                 //Motor system
//                 title: const Text(
//                   '',
//                 ),
//                 content: Container(),
//               ),
//               Step(
//                 state: currentStep > 4 ? StepState.complete : StepState.indexed,
//                 isActive: currentStep >= 4,
//                 //Level of Selectivity
//                 title: const Text(
//                   '',
//                 ),
//                 content: Container(),
//               ),
//               Step(
//                 state: currentStep > 4 ? StepState.complete : StepState.indexed,
//                 isActive: currentStep >= 4,
//                 //Muscloskeletal  Examination
//                 title: const Text(
//                   '',
//                 ),
//                 content: Container(),
//               ),
//               Step(
//                 state: currentStep > 4 ? StepState.complete : StepState.indexed,
//                 isActive: currentStep >= 4,
//                 //Rom
//                 title: const Text(
//                   '',
//                 ),
//                 content: Container(),
//               ),
//               Step(
//                 state: currentStep > 4 ? StepState.complete : StepState.indexed,
//                 isActive: currentStep >= 4,
//                 //Participation And Participation Restriction
//                 title: const Text(
//                   '',
//                 ),
//                 content: Container(),
//               ),
//               Step(
//                 state: currentStep > 4 ? StepState.complete : StepState.indexed,
//                 isActive: currentStep >= 4,
//                 title: const Text(
//                   //Goals
//                   '',
//                 ),
//                 content: Container(),
//               ),
//               Step(
//                 state: currentStep > 4 ? StepState.complete : StepState.indexed,
//                 isActive: currentStep >= 4,
//                 title: const Text(
//                   //Note
//                   '',
//                 ),
//                 content: Container(),
//               ),
//             ],
//             currentStep: currentStep,
//             type: StepperType.horizontal,
//             onStepCancel: () => currentStep == 0
//                 ? null
//                 : setState(() {
//                     currentStep -= 1;
//                   }),
//             onStepContinue: () async {
//               bool isLastStep = (currentStep == controle.getSteps().length - 1);
//               if (isLastStep) {
//               } else {
//                 setState(() {
//                   currentStep += 1;
//                 });
//               }
//             },
//             onStepTapped: (step) => setState(() {
//               currentStep = step;
//             }),
//             controlsBuilder: (context, details) {
//               return Row(
//                 children: [
//                   Expanded(
//                       child: ElevatedButton(
//                     onPressed: details.onStepContinue,
//                     child: Text(
//                       currentStep == 4 ? 'Finish' : 'Next',
//                       style: const TextStyle(fontSize: 13, color: Colors.white),
//                     ),
//                   )),
//                   if (currentStep != 0)
//                     SizedBox(
//                       width: 15,
//                     ),
//                   if (currentStep != 0)
//                     Expanded(
//                         child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white),
//                       onPressed: details.onStepCancel,
//                       child: Text(
//                         'Back',
//                         style: TextStyle(
//                             fontSize: 13, color: AppColors.primarycolor),
//                       ),
//                     )),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
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