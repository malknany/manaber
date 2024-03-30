// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/profile_pationt/tretment_plan/cubit/tretment_plan_cubit.dart';
import 'package:manaber/features/doctor/profile_pationt/tretment_plan/widget/item_plan.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'widget/tretment_plan_entry_data.dart';

import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';

class TretmentPlanView extends StatefulWidget {
  const TretmentPlanView({super.key, required this.id});
  final String id;

  @override
  _TretmentPlanViewState createState() => _TretmentPlanViewState();
}

class _TretmentPlanViewState extends State<TretmentPlanView> {
  // TretmentPlanControle planControle = TretmentPlanControle();

  @override
  void initState() {
    context.read<TreatmentPlanCubit>().getTretmentPlan(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tretment Plans'),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<TreatmentPlanCubit, TreatmentPlanState>(
        builder: (context, state) {
          if (state is TreatmentPlanLoading) {
            return const SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            );
          }
          if (state is TreatmentPlanError) {
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
          if (state is TretmentPlanEmpty) {
            return const SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Text(
                  "No Plans",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }
          if (state is TretmentPlanSuccess) {
            final model = state.listOfModelTretmentPlan;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView.builder(
                itemCount: model.length,
                itemBuilder: (ctx, index) {
                  return ItemPlan(
                      onDismissed: (p0) {
                        // model.removeAt(model[index]);
                        print(widget.id);
                        print(model[index].id);
                        print(model[index].patientId);
                        context.read<TreatmentPlanCubit>().delatePlan(
                                model[index].patientId, model[index].id);
                      },
                      modelTretmentPlan: model[index]);
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          final refresh = await navigateTo(
              context,
              BlocProvider(
                create: (context) => TreatmentPlanCubit(),
                child: TreatmentPlanDataEntry(
                  id: widget.id,
                ),
              ));

          if (refresh == 'refresh') {
            // ignore: use_build_context_synchronously
            context.read<TreatmentPlanCubit>().getTretmentPlan(widget.id);
          }
        },
      ),
    );
  }
}
