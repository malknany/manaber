// ignore_for_file: library_private_types_in_public_api



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/profile_pationt/last_ressessment/cubit/Last_reassessment_cubit.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/styles.dart';

class LastReassessmentDataEntry extends StatefulWidget {
  const LastReassessmentDataEntry({super.key, required this.id});
  final String id;

  @override
  _LastReassessmentDataEntryState createState() => _LastReassessmentDataEntryState();
  // final TretmentPlanControle planControle;
}

class _LastReassessmentDataEntryState extends State<LastReassessmentDataEntry> {
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
              labelname: 'Title of Last Reassessment',
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
                context.read<LastReassessmentCubit>().postLastReassessment(
                      id: widget.id,
                      titleName: titleNameControle.text,
                      listofPlans: listOfPlans,
                    );
              },
            ),
            BlocBuilder<LastReassessmentCubit, LastReassessmentState>(
              builder: (context, state) {
                if (state is LastReassessmentLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primarycolor,
                    ),
                  );
                }
                if (state is LastReassessmentSuccessUpLoade) {
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
                if (state is LastReassessmentError) {
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
