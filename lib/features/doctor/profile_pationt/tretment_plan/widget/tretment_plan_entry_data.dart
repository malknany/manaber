// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/profile_pationt/tretment_plan/cubit/tretment_plan_cubit.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/styles.dart';

import '../../../../../shared/components/components.dart';

class TreatmentPlanDataEntry extends StatefulWidget {
  const TreatmentPlanDataEntry({super.key, required this.id});
  final String id;

  @override
  _TreatmentPlanDataEntryState createState() => _TreatmentPlanDataEntryState();
}

class _TreatmentPlanDataEntryState extends State<TreatmentPlanDataEntry> {
  List<TextEditingController> controllers = [];
  List<String> listOfPlans = [];
  int counter = 1;
  final TextEditingController titleNameControl = TextEditingController();

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
                textEditingController: titleNameControl,
                labelName: ' title of plan'),
            ...controllers.map((controller) => TextFormFiledStepper(
                  labelName: "Step$counter",
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
                  listOfPlans.add(control.text);
                }
                context.read<TreatmentPlanCubit>().postPlan(
                    id: widget.id,
                    titleName: titleNameControl.text,
                    listofPlans: listOfPlans);
                // Navigator.pop(context, 'refresh');
              },
            ),
            BlocBuilder<TreatmentPlanCubit, TreatmentPlanState>(
              builder: (context, state) {
                if (state is TreatmentPlanLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  );
                }
                if (state is TreatmentPlanSuccessUpLoaded) {
                  Future.delayed(
                    const Duration(seconds: 1),
                    () {
                      itemSnackBar(context, 'تم اضافه خطه علاجيه جديده',
                          AppColors.primaryColor);
                      Navigator.pop(context, 'refresh');
                    },
                  );
                  return const Icon(
                    Icons.check,
                    color: AppColors.primaryColor,
                  );
                }
                if (state is TreatmentPlanError) {
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
