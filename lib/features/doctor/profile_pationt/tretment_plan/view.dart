import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/profile_pationt/tretment_plan/controle.dart';

import 'package:manaber/features/doctor/profile_pationt/tretment_plan/widget/data_view.dart';
import 'package:manaber/features/doctor/profile_pationt/tretment_plan/widget/tretment_plan_entry_data.dart';

import 'package:manaber/shared/components/constants.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/styles.dart';

class TretmentPlanView extends StatefulWidget {
  const TretmentPlanView({super.key});

  @override
  _TretmentPlanViewState createState() => _TretmentPlanViewState();
}

class _TretmentPlanViewState extends State<TretmentPlanView> {
  TretmentPlanControle planControle = TretmentPlanControle();
  bool isRefresh = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tretment Plans'),
        backgroundColor: Colors.white,
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
                  itemBuilder: (context, index) => GestureDetector(
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
                              width:
                                  MediaQueryHelper.sizeFromWidth(context, 1.2),
                              child: Column(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Plan${index + 1}",
                                      style: AppTextStyles.lrTitles.copyWith(
                                          color: AppColors.primarycolor),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: IconButton(
                                        onPressed: () {
                                          planControle.listofModel
                                              .removeAt(index);
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
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
