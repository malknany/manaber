// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'controle.dart';

import 'widget/data_view.dart';
import 'widget/tretment_plan_entry_data.dart';

import '../../../../shared/components/constants.dart';
import '../../../../shared/components/navigator.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';

class TretmentPlanView extends StatefulWidget {
  const TretmentPlanView({super.key});

  @override
  _TretmentPlanViewState createState() => _TretmentPlanViewState();
}

class _TretmentPlanViewState extends State<TretmentPlanView> {
  TretmentPlanControle planControle = TretmentPlanControle();
  bool isRefresh = false;
  bool isDelete = false;
  @override
  void dispose() {
    isDelete = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tretment Plans'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isDelete = !isDelete;
                });
              },
              icon: const Icon(
                Icons.delete,
                color: AppColors.primarycolor,
              ))
        ],
      ),
      body: isRefresh
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: planControle.listofModel.length,
                  itemBuilder: (context, index) => Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              navigateTo(
                                  context,
                                  DataView(
                                    controle: planControle.listofModel[index],
                                    index: index + 1,
                                  ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Material(
                                shadowColor: AppColors.primarycolor,
                                elevation: 10,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: MediaQuery.sizeOf(context).height / 4,
                                  width: MediaQueryHelper.sizeFromWidth(
                                      context, 1.2),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "Plan${index + 1}",
                                            style: AppTextStyles.lrTitles
                                                .copyWith(
                                                    color:
                                                        AppColors.primarycolor),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          isDelete
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          planControle.listofModel
                                              .removeAt(index);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      )),
            )
          : const SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Text("No Plans",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primarycolor,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          final refresh = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TrentmentPlanDataEntry(
                      planControle: planControle,
                    )),
          );
          if (refresh == 'refresh') {
            setState(() {
              isRefresh = true;
            });
          }
        },
      ),
    );
  }
}
