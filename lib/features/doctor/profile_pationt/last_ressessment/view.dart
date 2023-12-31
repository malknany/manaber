import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/profile_pationt/last_ressessment/cubit/Last_reassessment_cubit.dart';
import 'package:manaber/features/doctor/profile_pationt/last_ressessment/widget/item_plan.dart';
import 'package:manaber/features/doctor/profile_pationt/last_ressessment/widget/tretment_plan_entry_data.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/styles.dart';

class LastReassessmentView extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LastReassessmentViewState createState() => _LastReassessmentViewState();
  const LastReassessmentView({super.key, required this.id});
  final String id;
}

class _LastReassessmentViewState extends State<LastReassessmentView> {
  @override
  void initState() {
    context.read<LastReassessmentCubit>().getLastReassessment(widget.id);
    super.initState();
  }

  bool isNotEmptyPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Last Reassessment'),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<LastReassessmentCubit, LastReassessmentState>(
        builder: (context, state) {
          if (state is LastReassessmentLoading) {
            return const SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primarycolor,
                ),
              ),
            );
          }
          if (state is LastReassessmentError) {
            return SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Text(
                state.msg,
                textDirection: TextDirection.rtl,
                style: AppTextStyles.lrTitles
                    .copyWith(color: Colors.red, fontSize: 15),
              ),
            );
          }
          if (state is LastReassessmentEmpty) {
            isNotEmptyPage = false;
            return const SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Nothing Yet",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }
          if (state is LastReassessmentSuccess) {
            final model = state.listOfModelLastReassessment;
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ItemLastReassessment(
                  modelLastReassessment: model,
                ));
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: BlocBuilder<LastReassessmentCubit,LastReassessmentState>(
        builder: (context, state) {
          if (state is LastReassessmentEmpty) {
            return FloatingActionButton(
              backgroundColor: AppColors.primarycolor,
              child: const Icon(Icons.add, color: Colors.white),
              onPressed: () async {
                final refresh = await navigateTo(
                  context,
                  BlocProvider(
                    create: (context) => LastReassessmentCubit(),
                    child: LastReassessmentDataEntry(
                      id: widget.id,
                    ),
                  ),
                );

                if (refresh == 'refresh') {
                  // ignore: use_build_context_synchronously
                  context
                      .read<LastReassessmentCubit>()
                      .getLastReassessment(widget.id);
                }
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
