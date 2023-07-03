import 'package:flutter/material.dart';
import 'package:manaber/features/admin/accepte_home_page/widget/item_card_accept.dart';
import 'package:manaber/shared/components/constants.dart';
import 'package:manaber/shared/styles/images.dart';
import 'package:manaber/shared/styles/styles.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

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
                ItemAccepteAdmin(
                    name: 'محمد الكناني', job: 'طبيب', number: '0506184132'),
                ItemAccepteAdmin(
                    name: 'احمد الكناني',
                    job: 'موظف استقبال',
                    number: '050964753'),
                ItemAccepteAdmin(
                    name: 'احمد الكناني',
                    job: 'موظف استقبال',
                    number: '050964753'),
                ItemAccepteAdmin(
                    name: 'احمد الكناني',
                    job: 'موظف استقبال',
                    number: '050964753'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
