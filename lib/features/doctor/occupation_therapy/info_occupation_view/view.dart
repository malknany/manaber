import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/occupation_therapy/info_occupation_view/widget/BehaviorADLS_view.dart';
import 'package:manaber/features/doctor/occupation_therapy/info_occupation_view/widget/Occupational_perform_view.dart';
import 'package:manaber/features/doctor/occupation_therapy/info_occupation_view/widget/associated_disorders_view.dart';
import 'package:manaber/features/doctor/occupation_therapy/info_occupation_view/widget/body_function_view.dart';
import 'package:manaber/features/doctor/occupation_therapy/info_occupation_view/widget/note_occupation_view.dart';
import 'package:manaber/features/doctor/occupation_therapy/info_occupation_view/widget/personal_history.dart';
import 'package:manaber/features/doctor/occupation_therapy/stepper/controler.dart';
import 'package:manaber/features/doctor/occupation_therapy/stepper/view.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';

class InfoOccupationScreen extends StatefulWidget {
  const InfoOccupationScreen(
      {super.key,
      required this.controleAssociatedDisorders,
      required this.controleBehaviorADLS,
      required this.controleBodyFunctionStrucer,
      required this.controleOccupationPreformance,
      required this.controlePersonalHistory});
  final StepperPersonalHistory controlePersonalHistory;
  final StepperAssociatedDisorders controleAssociatedDisorders;
  final StepperBodyFunctionStrucer controleBodyFunctionStrucer;
  final StepperBehaviorADLS controleBehaviorADLS;
  final StepperOccupationPreformance controleOccupationPreformance;

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
                    controlerAssociatedDisorders:
                        widget.controleAssociatedDisorders,
                    controlerBehaviorADLS: widget.controleBehaviorADLS,
                    controlerBodyFunctionStrucer:
                        widget.controleBodyFunctionStrucer,
                    controlerOccupationPreformance:
                        widget.controleOccupationPreformance,
                    controlerPersonal: widget.controlePersonalHistory));
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
                          controlePersonalHistory:
                              widget.controlePersonalHistory,
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
                          controleAssociatedDisorders:
                              widget.controleAssociatedDisorders,
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
                          controleBodyFunctionStrucer:
                              widget.controleBodyFunctionStrucer,
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
                          controleBehaviorADLS: widget.controleBehaviorADLS,
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
                          controleOccupationPreformance:
                              widget.controleOccupationPreformance,
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
                            controleOccupationPreformance:
                                widget.controleOccupationPreformance,
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
