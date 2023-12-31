import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/admin/accepter_page/cubit/pending_cubit.dart';
import 'package:manaber/features/admin/accepter_page/view.dart';
import 'package:manaber/features/admin/delete_from_system/cubit/delate_user_from_system_cubit.dart';
import 'package:manaber/features/admin/delete_from_system/view.dart';
import 'package:manaber/features/admin/our_section_admin/widget/item_sectione_admin.dart';
import 'package:manaber/shared/components/navigator.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SectionItemAdmin(
                      screen: BlocProvider(
                        create: (context) => PendingCubit(),
                        child: const AdminAcceptUser(),
                      ),
                      sectionname: 'قبول ورفض الطلبات',
                    ),
                  ),
                  const SizedBox(width: 30,),
                  Expanded(
                    child: SectionItemAdmin(
                      screen: BlocProvider(
                        create: (context) => DelateUserFromSystemCubit(),
                        child: const AdminDeleteFromSystem(),
                      ),
                      sectionname: 'حذف مستخدم من النظام',
                    ),
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
