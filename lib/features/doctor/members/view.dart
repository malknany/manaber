import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/members/cubit/patients_department_cubit.dart';
import 'package:manaber/features/doctor/members/widget/item_member.dart';
import 'package:manaber/features/doctor/members/widget/item_sersh.dart';
import 'package:manaber/features/doctor/profile_pationt/profile_view/view.dart';
import 'package:manaber/shared/components/navigator.dart';
import '../../../shared/styles/colors.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({Key? key, required this.department}) : super(key: key);
  final String department;

  @override
  State<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  @override
  void initState() {
    BlocProvider.of<PatientsDepartmentCubit>(context)
        .getPationtDepartment(widget.department);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              ItemSearch(
                  onChanged: (value) => context
                      .read<PatientsDepartmentCubit>()
                      .filterListOfPatient(value)),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<PatientsDepartmentCubit, PatientsDepartmentState>(
                builder: (context, state) {
                  if (state is PatientsDepartmentLoading) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primarycolor,
                        ),
                      ),
                    );
                  }
                  if (state is PatientsDepartmentEmpty) {
                    return const Expanded(
                      child: Center(
                        child: Text(
                          "لا يوجد مرضى",
                          style:
                              TextStyle(fontSize: 20, color: Color(0xff130B32)),
                        ),
                      ),
                    );
                  }
                  if (state is PatientsDepartmentErorr) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          state.msg,
                          style: const TextStyle(
                              fontSize: 20, color: Color(0xff130B32)),
                        ),
                      ),
                    );
                  }
                  if (state is PatientsDepartmentSuccess) {
                    return Expanded(
                      child: ListView.separated(
                        itemCount: state.listOfPationt.length,
                        itemBuilder: (context, index) => PatientItem(
                          onTap: () {
                            navigateTo(
                              context,
                              ProfilePationtScreen(
                                id: state.listOfPationt[index].id,
                                department: widget.department,
                              ),
                            );
                          },
                          patientName: state.listOfPationt[index].name,
                        ),
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 30,
                          );
                        },
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
