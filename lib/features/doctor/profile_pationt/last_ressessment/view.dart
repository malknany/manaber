import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/Last_reassessment_cubit.dart';
import 'widget/item_plan.dart';
import 'widget/last_reassessment_entry_data.dart';
import '../../../../shared/components/navigator.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';

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
              child: ListView.builder(
                itemCount: model.length,
                itemBuilder: (ctx, index) {
                  return ItemLastReassessment(
                      onDismissed: (p0) {
                        // model.removeAt(model[index]);
                        print(widget.id);
                        print(model[index].id);
                        print(model[index].patientId);
                        context.read<LastReassessmentCubit>().delatePlan(
                                model[index].patientId, model[index].id);
                      },
                      modelLastReassessment: model[index]);
                },
              ),
            );
            // final model = state.listOfModelLastReassessment;
            // return Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //     child: ListView.builder(
            //       // itemCount: model.,
            //       itemBuilder: (context, idx) {
            //         return ItemLastReassessment(
            //         onDismissed: (p0) {
            //           print(widget.id);
            //               print(model[idx].id);
            //               print(model[idx].patientId);
            //               context.read<LastReassessmentCubit>().delatePlan(
            //                       model[idx].patientId, model[idx].id);
            //         },
            //         modelLastReassessment: model,
            //       );
            //       },
                  
            //     ));
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
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
              ));

          if (refresh == 'refresh') {
            // ignore: use_build_context_synchronously
            context
                .read<LastReassessmentCubit>()
                .getLastReassessment(widget.id);
          }
        },
      ),
      // BlocBuilder<LastReassessmentCubit,LastReassessmentState>(
      //   builder: (context, state) {
      //     if (state is LastReassessmentEmpty) {
      //       return FloatingActionButton(
      //         backgroundColor: AppColors.primarycolor,
      //         child: const Icon(Icons.add, color: Colors.white),
      //         onPressed: () async {
      //           final refresh = await navigateTo(
      //             context,
      //             BlocProvider(
      //               create: (context) => LastReassessmentCubit(),
      //               child: LastReassessmentDataEntry(
      //                 id: widget.id,
      //               ),
      //             ),
      //           );

      //           if (refresh == 'refresh') {
      //             // ignore: use_build_context_synchronously
      //             context
      //                 .read<LastReassessmentCubit>()
      //                 .getLastReassessment(widget.id);
      //           }
      //         },
      //       );
      //     } else {
      //       return const SizedBox.shrink();
      //     }
      //   },
      // ),
    );
  }
}
