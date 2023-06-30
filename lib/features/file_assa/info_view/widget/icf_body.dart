import 'package:flutter/material.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';

class ICFBodyView extends StatelessWidget {
  const ICFBodyView({super.key});

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
        title: const Text('Body function',
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
                      title: "Mental status",
                      value: 'Normal'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Voice Speech ",
                      value: ''),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Function of metabolic and endocrine",
                      value: 'Less than nomal'),
                  InfoRowItem(
                      columnWidth: columnWidth, title: "Gender", value: 'Male'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Function of Cardiovascular",
                      value: ''),
                  // const DividerItem(text: 'Sensory Examination'),
                  const Text('Sensory Examination',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Superficial",
                      value: 'fnaskjfajkslbfkasdjbfkjasb'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Vestibular",
                      value: 'Test*' * 10),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Proprioception",
                      value: 'kslbfkasdjbfkjasbf*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Tactile",
                      value: 'Test*' * 5),
                  const Text('GaiT Problems ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Stance phase",
                      value: 'fsadnfajsnfknvkj--*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Swing phase",
                      value: 'Test*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Balance",
                      value: 'Test*'),
                  const Text('Developmental Milestones ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Head control",
                      value: 'Test*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Rolling",
                      value: 'Test*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Creeping",
                      value: 'Test*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Crawling",
                      value: 'Test*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Sitting",
                      value: 'Test*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Standing",
                      value: 'Test*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Walking",
                      value: 'Test*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Fine Motor Function (Hand Function)",
                      value: 'Test*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Vision",
                      value: 'Test*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Hearing",
                      value: 'nomal _ less than - Test*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "involantary movment",
                      value: 'Test*'),
                  const Text('Reflexese ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Palmar reflex",
                      value: 'Integrated'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Planter reflex",
                      value: 'Not integrated'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Rooting reflex",
                      value: 'Not integrated'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Sucking reflex",
                      value: 'Not integrated'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Rooting reflex",
                      value: 'Not integrated'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Supine labyrinthine",
                      value: 'Not integrated'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Prone labyrinthine",
                      value: 'Not integrated'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Symmetrical tonic neck reflex",
                      value: 'Not integrated'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Asymmetrical tonic neck reflex",
                      value: 'Not integrated'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Foot-hand replacement",
                      value: 'Not integrated'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Moro reflex",
                      value: 'Not integrated'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Landau reflex",
                      value: 'Not integrated'),
                  const Text('Reflexese ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Protective",
                      value: 'Not integrated'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Righting and Equilibrium reflex",
                      value: 'Integrated'),
                  const Text('Muscle strength',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Gluteal'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Abductors'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Adductors'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Hip flexors'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Hip IR'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Hip ER'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Quadriceps'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Hamstring'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Plantar flexors'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Shoulder flexors'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Shoulder Extensors'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Shoulder'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Abductors'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Shoulder'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Adductors'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Shoulder IR'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Shoulder ER'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Elbow Flexors'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-20',
                      columnWidth: columnWidth,
                      title: 'Elbow Extensors'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Wrist Flexors'),
                  RowItemRightLeft(
                      right: '5',
                      left: '-3',
                      columnWidth: columnWidth,
                      title: 'Wrist Extensors'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Muscle Tone",
                      value: "General Hypotonia-openText"),
                  const Text('Muscle',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  RowItemRightLeft(
                      right: '0',
                      left: '+1',
                      columnWidth: columnWidth,
                      title: 'Adductors (Knee flexion)'),
                  RowItemRightLeft(
                      right: '0',
                      left: '+1',
                      columnWidth: columnWidth,
                      title: 'Adductors (Knee Extension)'),
                  RowItemRightLeft(
                      right: '0',
                      left: '+1',
                      columnWidth: columnWidth,
                      title: 'Illiospoas'),
                  RowItemRightLeft(
                      right: '0',
                      left: '+1',
                      columnWidth: columnWidth,
                      title: 'Hip IR'),
                  RowItemRightLeft(
                      right: '0',
                      left: '+1',
                      columnWidth: columnWidth,
                      title: 'Hip ER'),
                  RowItemRightLeft(
                      right: '0',
                      left: '+1',
                      columnWidth: columnWidth,
                      title: 'Quadriceps'),
                  RowItemRightLeft(
                      right: '0',
                      left: '+1',
                      columnWidth: columnWidth,
                      title: 'Hamstring'),
                  RowItemRightLeft(
                      right: '0',
                      left: '+1',
                      columnWidth: columnWidth,
                      title: 'Gastrocnemius'),
                  RowItemRightLeft(
                      right: '0',
                      left: '+1',
                      columnWidth: columnWidth,
                      title: 'Soleus'),
                  RowItemRightLeft(
                      right: '0',
                      left: '+1',
                      columnWidth: columnWidth,
                      title: 'Tibialis Ant'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Muscle Bulk",
                      value: 'atrophy_less'),
                  const Text('Level of Selectivity',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Upper limb",
                      value: 'Poor'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Lower limb",
                      value: 'Normal'),
                  const Text('Muscle',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  RowItemRightLeft(
                      right: '1',
                      left: '0',
                      columnWidth: columnWidth,
                      title: 'Muscle'),
                  RowItemRightLeft(
                      right: '1',
                      left: '0',
                      columnWidth: columnWidth,
                      title: 'Abductors'),

                  RowItemRightLeft(
                      right: '1',
                      left: '0',
                      columnWidth: columnWidth,
                      title: 'Hip flexors'),
                  RowItemRightLeft(
                      right: '1',
                      left: '0',
                      columnWidth: columnWidth,
                      title: 'Quadriceps'),
                  RowItemRightLeft(
                      right: '1',
                      left: '0',
                      columnWidth: columnWidth,
                      title: 'Hamstring'),
                  RowItemRightLeft(
                      right: '1',
                      left: '0',
                      columnWidth: columnWidth,
                      title: 'Planter flexors'),
                  RowItemRightLeft(
                      right: '1',
                      left: '0',
                      columnWidth: columnWidth,
                      title: 'Dorsiflexors'),
                  RowItemRightLeft(
                      right: '1',
                      left: '0',
                      columnWidth: columnWidth,
                      title: 'Shoulder flexors'),
                  RowItemRightLeft(
                      right: '1',
                      left: '0',
                      columnWidth: columnWidth,
                      title: 'Shoulder Extensors'),
                  RowItemRightLeft(
                      right: '1',
                      left: '0',
                      columnWidth: columnWidth,
                      title: 'Shoulder Abductors'),
                  RowItemRightLeft(
                      right: '1',
                      left: '0',
                      columnWidth: columnWidth,
                      title: 'Elbow Flexors'),
                  RowItemRightLeft(
                      right: '1',
                      left: '0',
                      columnWidth: columnWidth,
                      title: 'Elbow Extensors'),
                  RowItemRightLeft(
                      right: '1',
                      left: '0',
                      columnWidth: columnWidth,
                      title: 'Wrist Flexors'),
                  RowItemRightLeft(
                      right: '1',
                      left: '0',
                      columnWidth: columnWidth,
                      title: 'Wrist Extensors'),
                  RowItemRightLeft(
                      right: '1',
                      left: '0',
                      columnWidth: columnWidth,
                      title: 'Finger Flexors'),
                  RowItemRightLeft(
                      right: '1',
                      left: '0',
                      columnWidth: columnWidth,
                      title: 'Finger Extensors'),

                  const Text('Rom',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: 'Hip',
                      value: 'flexibility'),
                  InfoRowItem(
                      columnWidth: columnWidth, title: 'knee', value: 'Normal'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: 'Ankle',
                      value: 'restricted'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: 'shoulder',
                      value: 'hyper'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: 'elbow',
                      value: 'flexibility'),
                  InfoRowItem(
                      columnWidth: columnWidth, title: 'note', value: 'Test*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: 'Deformities',
                      value: 'Text*'),
                  const Text('Posture And Alignment',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: 'From Sitting',
                      value: 'Text*'),
                  InfoRowItem(
                      columnWidth: columnWidth, title: 'Spine', value: 'Text*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: 'Pelvic',
                      value: 'Text*'),
                  const Text('Hip',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(
                      columnWidth: columnWidth, title: 'Rt', value: 'in risk '),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: 'Lf',
                      value: 'sublaxed  '),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
