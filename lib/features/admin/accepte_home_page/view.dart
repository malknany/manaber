import 'package:flutter/material.dart';
import 'package:manaber/features/admin/accepte_home_page/controle.dart';
import 'package:manaber/features/admin/accepte_home_page/widget/item_card_accept.dart';
import 'package:manaber/shared/components/constants.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';
import 'package:manaber/shared/styles/styles.dart';

class AdminHomePage extends StatefulWidget {
  AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final ControleUserAccepte controleUserAccepte = ControleUserAccepte();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.output,
                color: Colors.red,
              ))
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
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
                controleUserAccepte.userAcceptore.isEmpty
                    ? Center(child: Text('لا يوجد طلبات '))
                    : Column(
                        children: List.generate(
                          controleUserAccepte.userAcceptore.length,
                          (index) => ItemAccepteAdmin(
                              onPressedNo: () {
                                setState(() {
                                  controleUserAccepte.userAcceptore
                                      .removeAt(index);
                                });
                                final snackBar = SnackBar(
                                  duration: const Duration(seconds: 2),
                                  content: Text(
                                    textDirection: TextDirection.rtl,
                                    'تم الرفض',
                                    style: AppTextStyles.lrTitles
                                        .copyWith(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              onPressedOk: () {
                                setState(() {
                                  controleUserAccepte.userAcceptore
                                      .removeAt(index);
                                });
                                final snackBar = SnackBar(
                                  duration: const Duration(seconds: 2),
                                  content: Text(
                                    textDirection: TextDirection.rtl,
                                    'تم مقبول',
                                    style: AppTextStyles.lrTitles
                                        .copyWith(color: Colors.white),
                                  ),
                                  backgroundColor: AppColors.primarycolor,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              name:
                                  controleUserAccepte.userAcceptore[index].name,
                              job: controleUserAccepte.userAcceptore[index].job,
                              number: controleUserAccepte
                                  .userAcceptore[index].number),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
