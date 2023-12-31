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
  List<TextEditingController> controllers = [];
  List<String> listOfLastReassessment = [];
  int counter = 1;
  final TextEditingController titleNameControle = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllers.add(TextEditingController());
    setState(() {});
  }

  void _addTextField() {
    setState(() {
      controllers.add(TextEditingController());
    });
    counter++;
  }

  void _removeTextField() {
    if (controllers.length > 1) {
      setState(() {
        controllers.removeLast();
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entry Data'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            TextFormFiledStepper(
                textEditingController: titleNameControle,
                labelname: ' title '),
            ...controllers.map((controller) => TextFormFiledStepper(
                  labelname: "Step$counter",
                  textEditingController: controller,
                )),
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
                for (final control in controllers) {
                  listOfLastReassessment.add(control.text);
                }
                context.read<LastReassessmentCubit>().postLastReassessment(
                    id: widget.id,
                    titleName: titleNameControle.text,
                    listofPlans: listOfLastReassessment);
                
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
                      itemSnackBar(context, 'تم اضافه بنجاح',
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
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
