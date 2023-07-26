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
  final id;

  @override
  _TretmentPlanViewState createState() => _TretmentPlanViewState();
}

class _TretmentPlanViewState extends State<TretmentPlanView> {
  // TretmentPlanControle planControle = TretmentPlanControle();

  @override
  void initState() {
    context.read<TretmentPlanCubit>().getTretmentPlan(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tretment Plans'),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<TretmentPlanCubit, TretmentPlanState>(
        builder: (context, state) {
          if (state is TretmentPlanLoading) {
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
          if (state is TretmentPlanError) {
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
                        context.read<TretmentPlanCubit>().delatePlan(
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
        backgroundColor: AppColors.primarycolor,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          final refresh = await navigateTo(
              context,
              BlocProvider(
                create: (context) => TretmentPlanCubit(),
                child: TrentmentPlanDataEntry(
                  id: widget.id,
                ),
              ));

          if (refresh == 'refresh') {
            context.read<TretmentPlanCubit>().getTretmentPlan(widget.id);
          }
        },
      ),
    );
  }
}
