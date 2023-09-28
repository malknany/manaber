import 'package:flutter/material.dart';
import '../../../model.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../../../../../../shared/styles/images.dart';

class BodyFunctionAndStrucerView extends StatelessWidget {
  const BodyFunctionAndStrucerView(
      {super.key,

      required this.bodyFunctionAndStrucer});

  final List<ModelPatientInfo> bodyFunctionAndStrucer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Body Function And Strucer',
          style: TextStyle(
            color: AppColors.primarycolor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3.5,
                    child: Image.asset(AppImages.occupationalTherapy)),
                const Text(
                  "occupational",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "All information about Patient",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 16.0),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: bodyFunctionAndStrucer.length,
                  itemBuilder: (context, index) {
                    var model = bodyFunctionAndStrucer[index];
                    if (index == 0) {
                      return Column(
                        children: [
                          const DividerItem(text: 'Neuromuscular Status'),
                          InfoRowItem(
                            value: model.answer ?? '',
                            title: model.question!,
                          ),
                        ],
                      );
                    }
                    return InfoRowItem(
                      value: model.answer ?? '',
                      title: model.question!,
                    );
                  },
                  separatorBuilder: (context, index) {
                    if (index == 2) {
                      return const DividerItem(text: 'Balance');
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            )),
      ),
    );
  }
}
