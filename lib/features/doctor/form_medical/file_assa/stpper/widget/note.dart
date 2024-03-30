import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/pateint_info_cubit.dart';
import '../../../model.dart';
import '../../../../../../shared/styles/styles.dart';
import '../model.dart';
import '../controller.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class Note extends StatelessWidget {
  const Note(
      {super.key,
      required this.note,
      required this.controlFileAssessment,
      required this.id});
  final String id;
  final ControlFileAssessment controlFileAssessment;
  final List<ModelPatientInfo> note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, 'refresh');
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: const Text('Note'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  var model = controlFileAssessment.listGoal.last;
                  if (model is TextFormFiledStepperModel) {
                    return Column(
                      children: [
                        TextFormFiledStepper(
                            hintText: note[0].answer,
                            labelName: model.labelName,
                            textEditingController: model.textEditingController),
                        ButtonText(
                          text: 'Save',
                          onPressed: () {
                            final listOfAnswer = _sendData();
                            BlocProvider.of<PatientInfoCubit>(context)
                                .postAnswerToApi(id, listOfAnswer);
                            // Navigator.pop(context, 'refresh');
                          },
                        ),
                        BlocBuilder<PatientInfoCubit, PatientInfoState>(
                          builder: (context, state) {
                            if (state is PatientLoading) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              );
                            }
                            if (state is PatientSuccess) {
                              return const Center(
                                  child: Icon(
                                Icons.check,
                                color: AppColors.primaryColor,
                              ));
                            }
                            if (state is PatientErrorMsg) {
                              return Text(
                                state.msg,
                                textDirection: TextDirection.rtl,
                                style: AppTextStyles.lrTitles
                                    .copyWith(color: Colors.red, fontSize: 15),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _sendData() {
    List<Map> listOfAnswer = [];
    int i = 1;
    for (final person in controlFileAssessment.listPatientInfo) {
      if (person is DropdownButtonItemModel) {
        listOfAnswer.add(
          ModelPatientInfo(
            questionId: i,
            answer:
                person.controller.text.isEmpty ? null : person.controller.text,
          ).toJson(),
        );
        i++;
      }
      if (person is TextFormFiledStepperModel) {
        listOfAnswer.add(
          ModelPatientInfo(
            questionId: i,
            answer: person.textEditingController.text.isEmpty
                ? 'null'
                : person.textEditingController.text,
          ).toJson(),
        );
        i++;
      }
    }

    for (final person in controlFileAssessment.listicfBody) {
      if (person is DropdownButtonItemModel) {
        listOfAnswer.add(
          ModelPatientInfo(
            question: person.labelName,
            questionId: i,
            answer:
                person.controller.text.isEmpty ? null : person.controller.text,
          ).toJson(),
        );
        i++;
      }
      if (person is TextFormFiledStepperModel) {
        listOfAnswer.add(
          ModelPatientInfo(
            questionId: i,
            answer: person.textEditingController.text.isEmpty
                ? 'null'
                : person.textEditingController.text,
          ).toJson(),
        );
        i++;
      }
      if (person is BottomSheetFileAssModel) {
        for (final item in person.itemList) {
          if (item is TextFormFiledStepperModel) {
            listOfAnswer.add(
              ModelPatientInfo(
                questionId: i,
                answer: item.textEditingController.text.isEmpty
                    ? 'null'
                    : item.textEditingController.text,
              ).toJson(),
            );
            i++;
          }
        }
      }
    }
    for (final person in controlFileAssessment.listNeurological) {
      if (person is TextFormFiledStepperModel) {
        listOfAnswer.add(
          ModelPatientInfo(
            questionId: i,
            answer: person.textEditingController.text.isEmpty
                ? 'null'
                : person.textEditingController.text,
          ).toJson(),
        );
        i++;
      }
      if (person is BottomSheetFileAssModel) {
        for (final item in person.itemList) {
          if (item is DropdownButtonItemModel) {
            listOfAnswer.add(
              ModelPatientInfo(
                question: person.name,
                questionId: i,
                answer:
                    item.controller.text.isEmpty ? null : item.controller.text,
              ).toJson(),
            );
            i++;
          }
        }
      }
    }
    for (final person in controlFileAssessment.listMotor) {
      if (person is DropdownButtonItemModel) {
        listOfAnswer.add(
          ModelPatientInfo(
            question: person.labelName,
            questionId: i,
            answer:
                person.controller.text.isEmpty ? null : person.controller.text,
          ).toJson(),
        );
        i++;
      }
      if (person is TextFormFiledStepperModel) {
        listOfAnswer.add(
          ModelPatientInfo(
            questionId: i,
            answer: person.textEditingController.text.isEmpty
                ? 'null'
                : person.textEditingController.text,
          ).toJson(),
        );
        i++;
      }
      if (person is BottomSheetFileAssModel) {
        for (final item in person.itemList) {
          if (item is TextFormFiledRightLiftModel) {
            listOfAnswer.add(
              ModelPatientInfo(
                question: item.labelName,
                questionId: i,
                left: item.controllerLeft.text.isEmpty
                    ? null
                    : int.parse(item.controllerLeft.text),
                right: item.controllerRight.text.isEmpty
                    ? null
                    : int.parse(item.controllerRight.text),
              ).toJson(),
            );
            i++;
          }
        }
      }
    }
    for (final person in controlFileAssessment.listlevelOfSelctivity) {
      if (person is DropdownButtonItemModel) {
        listOfAnswer.add(
          ModelPatientInfo(
            question: person.labelName,
            questionId: i,
            answer:
                person.controller.text.isEmpty ? null : person.controller.text,
          ).toJson(),
        );
        i++;
      }
      if (person is BottomSheetFileAssModel) {
        for (final item in person.itemList) {
          if (item is TextFormFiledRightLiftModel) {
            listOfAnswer.add(
              ModelPatientInfo(
                question: item.labelName,
                questionId: i,
                left: item.controllerLeft.text.isEmpty
                    ? null
                    : int.parse(item.controllerLeft.text),
                right: item.controllerRight.text.isEmpty
                    ? null
                    : int.parse(item.controllerRight.text),
              ).toJson(),
            );
            i++;
          }
        }
      }
    }
    for (final person in controlFileAssessment.listMuscloskelton) {
      if (person is TextFormFiledStepperModel) {
        listOfAnswer.add(
          ModelPatientInfo(
            questionId: i,
            answer: person.textEditingController.text.isEmpty
                ? 'null'
                : person.textEditingController.text,
          ).toJson(),
        );
        i++;
      }
      if (person is DropdownButtonItemModel) {
        listOfAnswer.add(
          ModelPatientInfo(
            question: person.labelName,
            questionId: i,
            answer:
                person.controller.text.isEmpty ? null : person.controller.text,
          ).toJson(),
        );
        i++;
      }
    }
    for (final person in controlFileAssessment.listRom) {
      if (person is TextFormFiledStepperModel) {
        listOfAnswer.add(
          ModelPatientInfo(
            questionId: i,
            answer: person.textEditingController.text.isEmpty
                ? 'null'
                : person.textEditingController.text,
          ).toJson(),
        );
        i++;
      }
      if (person is DropdownButtonItemModel) {
        listOfAnswer.add(
          ModelPatientInfo(
            question: person.labelName,
            questionId: i,
            answer:
                person.controller.text.isEmpty ? null : person.controller.text,
          ).toJson(),
        );
        i++;
      }
    }
    for (final person in controlFileAssessment.listParticipation) {
      if (person is TextFormFiledStepperModel) {
        listOfAnswer.add(
          ModelPatientInfo(
            questionId: i,
            answer: person.textEditingController.text.isEmpty
                ? 'null'
                : person.textEditingController.text,
          ).toJson(),
        );
        i++;
      }
    }
    for (final person in controlFileAssessment.listGoal) {
      if (person is TextFormFiledStepperModel) {
        listOfAnswer.add(
          ModelPatientInfo(
            questionId: i,
            answer: person.textEditingController.text.isEmpty
                ? 'null'
                : person.textEditingController.text,
          ).toJson(),
        );
        i++;
      }
      if (person is DropdownButtonItemModel) {
        listOfAnswer.add(
          ModelPatientInfo(
            question: person.labelName,
            questionId: i,
            answer:
                person.controller.text.isEmpty ? null : person.controller.text,
          ).toJson(),
        );
        i++;
      }
    }
    for (var element in listOfAnswer) {
      print(element);
    }
    print(listOfAnswer);
    return listOfAnswer;
  }
}
