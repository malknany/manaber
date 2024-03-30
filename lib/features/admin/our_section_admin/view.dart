import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../accepter_page/cubit/pending_cubit.dart';
import '../accepter_page/view.dart';
import '../delete_from_system/cubit/delate_user_from_system_cubit.dart';
import '../delete_from_system/view.dart';
import 'widget/item_sectione_admin.dart';
import '../../../shared/components/navigator.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              signOut(context);
            },
            icon: const Icon(
              Icons.output,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SectionItemAdmin(
                    screen: BlocProvider(
                      create: (context) => PendingCubit(),
                      child: const AdminAcceptUser(),
                    ),
                    sectionName: 'قبول ورفض الطلبات',
                  ),
                  SectionItemAdmin(
                    screen: BlocProvider(
                      create: (context) => DelateUserFromSystemCubit(),
                      child: const AdminDeleteFromSystem(),
                    ),
                    sectionName: 'حذف مستخدم من النظام',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
