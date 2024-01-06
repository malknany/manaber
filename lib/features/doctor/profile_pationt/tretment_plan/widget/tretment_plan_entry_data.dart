// // ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/profile_pationt/tretment_plan/cubit/tretment_plan_cubit.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/styles.dart';

import '../../../../../shared/components/components.dart';

class TrentmentPlanDataEntry extends StatefulWidget {
  const TrentmentPlanDataEntry({super.key, required this.id});
  final String id;

  @override
  _TrentmentPlanDataEntryState createState() => _TrentmentPlanDataEntryState();
  // final TretmentPlanControle planControle;
}

class _TrentmentPlanDataEntryState extends State<TrentmentPlanDataEntry> {
  List<String> listOfPlans = [];
  final TextEditingController titleNameControle = TextEditingController();

  void _addTextField() {
    setState(() {
      listOfPlans.add('');
    });
  }

  void _removeTextField() {
    if (listOfPlans.isNotEmpty) {
      setState(() {
        listOfPlans.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entry Data'),
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {
          Navigator.pop(context, 'refresh');
        }, icon: const Icon(Icons.arrow_back,color: AppColors.primarycolor,)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            TextFormFiledStepper(
              textEditingController: titleNameControle,
              labelname: 'Title of plan',
              onFieldSubmitted: (value) {
                setState(() {
                  titleNameControle.text = value!;
                });
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listOfPlans.length,
              itemBuilder: (context, index) => 
              TextFormFiledStepper(
                textEditingController: TextEditingController(
                  text: listOfPlans[index],
                ),
                labelname: "Step ${index + 1}",
                onChanged: (value) {
                  listOfPlans[index] = value!;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addTextField,
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _removeTextField,
                ),
              ],
            ),
            ButtonText(
              text: 'Save',
              onPressed: () {
                context.read<TretmentPlanCubit>().postPlan(
                      id: widget.id,
                      titleName: titleNameControle.text,
                      listofPlans: listOfPlans,
                    );
              },
            ),
            BlocBuilder<TretmentPlanCubit, TretmentPlanState>(
              builder: (context, state) {
                if (state is TretmentPlanLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primarycolor,
                    ),
                  );
                }
                if (state is TretmentPlanSuccessUpLoade) {
                  Future.delayed(
                    const Duration(seconds: 1),
                    () {
                      itemSnackBar(context, 'تم اضافه خطه علاجيه جديده',
                          AppColors.primarycolor);
                      Navigator.pop(context, 'refresh');
                    },
                  );
                  return const Icon(
                    Icons.check,
                    color: AppColors.primarycolor,
                  );
                }
                if (state is TretmentPlanError) {
                  return Text(
                    state.msg,
                    textDirection: TextDirection.rtl,
                    style: AppTextStyles.lrTitles
                        .copyWith(color: Colors.red, fontSize: 15),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleNameControle.dispose();
    super.dispose();
  }
}




// class _TrentmentPlanDataEntryState extends State<TrentmentPlanDataEntry> {
//   List<TextEditingController> controllers = [];
//   List<String> listOfPlans = [];
//   int counter = 1;
//   final TextEditingController titleNameControle = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     controllers.add(TextEditingController());
//     setState(() {});
//   }

//   void _addTextField() {
//     setState(() {
//       controllers.add(TextEditingController());
//     });
//     counter++;
//   }

//   void _removeTextField() {
//     if (controllers.length > 1) {
//       setState(() {
//         controllers.removeLast();
//         counter--;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Entry Data'),
//         backgroundColor: Colors.white,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//         child: ListView(
//           children: [
//             TextFormFiledStepper(
//                 textEditingController: titleNameControle,
//                 labelname: ' title of plan'),
//             ...controllers.map((controller) => TextFormFiledStepper(
//                   labelname: "Step$counter",
//                   textEditingController: controller,
//                 )),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.add),
//                   onPressed: _addTextField,
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.remove),
//                   onPressed: _removeTextField,
//                 ),
//               ],
//             ),
//             ButtonText(
//               text: 'Save',
//               onPressed: () {
//                 for (final control in controllers) {
//                   listOfPlans.add(control.text);
//                 }
//                 context.read<TretmentPlanCubit>().postPlan(
//                     id: widget.id,
//                     titleName: titleNameControle.text,
//                     listofPlans: listOfPlans);
//                 // Navigator.pop(context, 'refresh');
//               },
//             ),
//             BlocBuilder<TretmentPlanCubit, TretmentPlanState>(
//               builder: (context, state) {
//                 if (state is TretmentPlanLoading) {
//                   return const Center(
//                     child: CircularProgressIndicator(
//                       color: AppColors.primarycolor,
//                     ),
//                   );
//                 }
//                 if (state is TretmentPlanSuccessUpLoade) {
//                   Future.delayed(
//                     const Duration(seconds: 1),
//                     () {
//                       itemSnackBar(context, 'تم اضافه خطه علاجيه جديده',
//                           AppColors.primarycolor);
//                       Navigator.pop(context, 'refresh');
//                     },
//                   );
//                   return const Icon(
//                     Icons.check,
//                     color: AppColors.primarycolor,
//                   );
//                 }
//                 if (state is TretmentPlanError) {
//                   return Text(
//                     state.msg,
//                     textDirection: TextDirection.rtl,
//                     style: AppTextStyles.lrTitles
//                         .copyWith(color: Colors.red, fontSize: 15),
//                   );
//                 }
//                 return const SizedBox.shrink();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     for (var controller in controllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }
// }
