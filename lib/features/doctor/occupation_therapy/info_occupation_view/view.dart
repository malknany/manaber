import 'package:flutter/material.dart';
import 'widget/BehaviorADLS_view.dart';
import 'widget/Occupational_perform_view.dart';
import 'widget/associated_disorders_view.dart';
import 'widget/body_function_view.dart';
import 'widget/note_occupation_view.dart';
import 'widget/personal_history.dart';
import '../stepper/controler.dart';
import '../stepper/view.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/components/navigator.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/images.dart';

class InfoOccupationScreen extends StatefulWidget {
  const InfoOccupationScreen({
    super.key,
    required this.controleOccupation,
  });
  final ControleOccupation controleOccupation;

  @override
  State<InfoOccupationScreen> createState() => _InfoOccupationScreenState();
}

class _InfoOccupationScreenState extends State<InfoOccupationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.primarycolor,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final resulte = await navigateTo(
                context,
                StepperOccupation(
                  controleOccupation: widget.controleOccupation,
                ));
            if (resulte == 'refresh') {
              setState(() {});
            }
          },
          backgroundColor: AppColors.primarycolor,
          elevation: 0,
          child: const Icon(Icons.edit_outlined)),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3.5,
                    child: Image.asset(AppImages.occupationalTherapy)),
                const Text(
                  "Occupational Therapy",
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
                ButtonText(
                    text: 'personal history',
                    onPressed: () {
                      navigateTo(
                        context,
                        PersonalHistoryView(
                          controleOccupation: widget.controleOccupation,
                        ),
                      );
                    },
                    borderRadius: 7),
                ButtonText(
                    text: 'Associated disorders',
                    onPressed: () {
                      navigateTo(
                        context,
                        AssociatedDisordersView(
                          controleOccupation: widget.controleOccupation,
                        ),
                      );
                    },
                    borderRadius: 7),
                ButtonText(
                    text: 'body function & strucer',
                    onPressed: () {
                      navigateTo(
                        context,
                        BodyFunctionAndStrucerView(
                          controleOccupation: widget.controleOccupation,
                        ),
                      );
                    },
                    borderRadius: 7),
                ButtonText(
                    text: 'Behavior & A.D.L.S',
                    onPressed: () {
                      navigateTo(
                        context,
                        BehaviorADLSView(
                          controleOccupation: widget.controleOccupation,
                        ),
                      );
                    },
                    borderRadius: 7),
                ButtonText(
                    text: 'Occupational performance',
                    onPressed: () {
                      navigateTo(
                        context,
                        OccupationalPerformanceView(
                          controleOccupation: widget.controleOccupation,
                        ),
                      );
                    },
                    borderRadius: 7),
                ButtonText(
                    text: 'Note',
                    onPressed: () {
                      navigateTo(
                          context,
                          NoteOccupationalView(
                            controleOccupation: widget.controleOccupation,
                          ));
                    },
                    borderRadius: 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
