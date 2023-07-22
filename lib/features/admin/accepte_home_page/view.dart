import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/admin/accepte_home_page/cubit/pending_cubit.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'widget/item_card_accept.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  // final ControleUserAccepte controleUserAccepte = ControleUserAccepte();
  // String token = CacheHelper.getData(key: AppConstKey.token);
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PendingCubit>().getPendingUsers();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: SizedBox.shrink(),
        actions: [
          IconButton(
            onPressed: () {
              signout(context);
            },
            icon: const Icon(
              Icons.output,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: BlocBuilder<PendingCubit, PendingState>(
        builder: (context, state) {
          if (state is PendingEmpty) {
            return Center(
              child: Text(
                'لا يوجد طلبات ',
                style: AppTextStyles.lrTitles,
              ),
            );
          } else if (state is PendingLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primarycolor),
            );
          } else if (state is PendingErorr) {
            return Center(
              child: Text(
                state.msg,
                style: AppTextStyles.lrTitles,
              ),
            );
          } else if (state is PendingSuccess) {
            return SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQueryHelper.sizeFromHeight(context, 4.5),
                          width: MediaQueryHelper.sizeFromWidth(context, 1.2),
                          child: Image.asset(AppImages.admin)),
                      Text('الادمن',
                          style: AppTextStyles.lrTitles.copyWith(fontSize: 32)),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: List.generate(
                          state.listOfUserspending.length,
                          (index) => ItemAccepteAdmin(
                              onPressedNo: () {
                                setState(() {
                                  context.read<PendingCubit>().postDisApprove(
                                      state.listOfUserspending[index].id);
                                  state.listOfUserspending.removeAt(index);
                                });
                                ItemSnackBar(context, 'تم الرفض', Colors.red);
                              },
                              onPressedOk: () {
                                setState(() {
                                  context.read<PendingCubit>().postApprove(
                                      state.listOfUserspending[index].id);
                                  state.listOfUserspending.removeAt(index);
                                });
                                ItemSnackBar(context, 'تم مقبول',
                                    AppColors.primarycolor);
                              },
                              name: state.listOfUserspending[index].name!,
                              job: state.listOfUserspending[index].role! ==
                                      'DOCTOR'
                                  ? 'طبيب'
                                  : 'موظف استقبال',
                              number:
                                  state.listOfUserspending[index].phoneNumber!),
                        ),
                      ),
                    ],
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
