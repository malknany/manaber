import 'package:flutter/material.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';

class GoalsView extends StatelessWidget {
  const GoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primarycolor,
        elevation: 0,
        child: const Icon(Icons.edit_outlined),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Patient Data',
            style: TextStyle(
              color: AppColors.primarycolor,
            )),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final double columnWidth = maxWidth < 600 ? maxWidth : maxWidth / 2;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 3.5,
                      child: Image.asset(AppImages.fileAssessment)),
                  const Text(
                    "File Assessment",
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
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: 'Short Goals',
                      value: 'Test*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: 'Long Goals',
                      value: 'Test*'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
