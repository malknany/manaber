import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/admin/delete_from_system/cubit/delate_user_from_system_cubit.dart';
import 'package:manaber/features/admin/delete_from_system/widget/item_card_accept.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/styles.dart';

class AdminDeleteFromSystem extends StatefulWidget {
  const AdminDeleteFromSystem({super.key});

  @override
  State<AdminDeleteFromSystem> createState() => _AdminDeleteFromSystemState();
}

class _AdminDeleteFromSystemState extends State<AdminDeleteFromSystem> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DelateUserFromSystemCubit>().getPendingUsers();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حذف مستخدم من النظام'),
      ),
      body: BlocBuilder<DelateUserFromSystemCubit, DelateUserFromSystemState>(
        builder: (context, state) {
          if (state is DelateUserFromSystemEmpty) {
            return Center(
              child: Text(
                ' لا يوجد مستخدمين ',
                style: AppTextStyles.lrTitles,
              ),
            );
          } else if (state is DelateUserFromSystemLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primarycolor),
            );
          } else if (state is DelateUserFromSystemErorr) {
            return Center(
              child: Text(
                state.msg,
                style: AppTextStyles.lrTitles,
              ),
            );
          } else if (state is DelateUserFromSystemSuccess) {
            return RefreshIndicator(
              color: AppColors.primarycolor,
              onRefresh: () {
                return context
                    .read<DelateUserFromSystemCubit>()
                    .getPendingUsers();
              },
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: List.generate(
                            state.listOfUserspending.length,
                            (index) => ItemDeleteAdmin(
                                onPressedNo: () {
                                  setState(() {
                                    context
                                        .read<DelateUserFromSystemCubit>()
                                        .deleteUser(
                                            state.listOfUserspending[index].id);
                                    state.listOfUserspending.removeAt(index);
                                  });
                                  itemSnackBar(context, 'تم الحذف', Colors.red);
                                },
                                name: state.listOfUserspending[index].name!,
                                job: state.listOfUserspending[index].role! ==
                                        'DOCTOR'
                                    ? 'طبيب'
                                    : 'موظف استقبال',
                                number: state
                                    .listOfUserspending[index].phoneNumber!),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
