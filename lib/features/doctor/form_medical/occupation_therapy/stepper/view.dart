import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../keep_alive.dart';
import '../../cubit/pateint_info_cubit.dart';
import '../../model.dart';
import 'controler.dart';
import 'widget/Behavior_ADLS.dart';
import 'widget/associated_disorders.dart';
import 'widget/body_function_strucer.dart';
import 'widget/note_occupation.dart';
import 'widget/occupational_perform.dart';
import 'widget/personal_history_stepper.dart';
import '../../../../../shared/styles/colors.dart';

class StepperOccupation extends StatefulWidget {
  const StepperOccupation(
      {super.key,
      required this.controleOccupation,
      required this.id,
      required this.listOfInfoPatient});
  final String id;
  final List<ModelPatientInfo> listOfInfoPatient;
  final ControlOccupation controleOccupation;

  @override
  State<StepperOccupation> createState() => _StepperOccupationState();
}

class _StepperOccupationState extends State<StepperOccupation>
    with AutomaticKeepAliveClientMixin<StepperOccupation> {
  final PageController _pageController = PageController();

  void _navigateToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  void _navigateToPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final List<ModelPatientInfo> personalHistory = [];
    final List<ModelPatientInfo> associatedDisorders = [];
    final List<ModelPatientInfo> bodyFunctionAndStrucer = [];
    final List<ModelPatientInfo> behaviorAndADLS = [];
    final List<ModelPatientInfo> note = [];
    for (final person in widget.listOfInfoPatient) {
      if (person.section == 'Personal History') {
        personalHistory.add(person);
      }
      if (person.section == 'Associated Disorders') {
        associatedDisorders.add(person);
      }
      if (person.section == 'Body Function and Structure') {
        bodyFunctionAndStrucer.add(person);
      }
      if (person.section == 'Behavior and ADLS') {
        behaviorAndADLS.add(person);
      }
      if (person.section == 'Occupation Performance') {
        note.add(person);
      }
    }
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                KeepAliveScreen(
                  page: PersonalHistory(
                      personalHistory: personalHistory,
                      controlOccupation: widget.controleOccupation),
                ),
                KeepAliveScreen(
                  page: AssociatedDisorders(
                      controlOccupation: widget.controleOccupation,
                      associatedDisorders: associatedDisorders),
                ),
                KeepAliveScreen(
                  page: BodyFunctionStrucer(
                      controlOccupation: widget.controleOccupation,
                      bodyFunctionStrucer: bodyFunctionAndStrucer),
                ),
                KeepAliveScreen(
                  page: BehaviorADLS(
                      controlOccupation: widget.controleOccupation,
                      behaviorADLS: behaviorAndADLS),
                ),
                KeepAliveScreen(
                  page: OccupationalPerformance(
                      controlOccupation: widget.controleOccupation,
                      occupationalPerformance: note),
                ),
                BlocProvider(
                  create: (context) => PatientInfoCubit(),
                  child: KeepAliveScreen(
                    page: NoteOccupation(
                        noteOccupation: note,
                        controlOccupation: widget.controleOccupation,
                        id: widget.id),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () {
                  _navigateToPreviousPage();
                },
                child:
                    const Text('back', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () {
                  _navigateToNextPage();
                },
                child:
                    const Text('Next', style: TextStyle(color: Colors.white)),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
