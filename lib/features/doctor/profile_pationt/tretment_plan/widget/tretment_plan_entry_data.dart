import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/profile_pationt/tretment_plan/controle.dart';
import 'package:manaber/features/doctor/profile_pationt/tretment_plan/model.dart';
import 'package:manaber/shared/components/components.dart';

class TrentmentPlanDataEntry extends StatefulWidget {
  const TrentmentPlanDataEntry({super.key, required this.planControle});

  @override
  _TrentmentPlanDataEntryState createState() => _TrentmentPlanDataEntryState();
  final TretmentPlanControle planControle;
}

class _TrentmentPlanDataEntryState extends State<TrentmentPlanDataEntry> {
  List<TextEditingController> controllers = [];
  int counter = 1;

  @override
  void initState() {
    super.initState();
    controllers.add(TextEditingController());
    setState(() {});
  }

  void _addTextField() {
    setState(() {
      controllers.add(TextEditingController());
    });
    counter++;
  }

  void _removeTextField() {
    if (controllers.length > 1) {
      setState(() {
        controllers.removeLast();
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entry Data'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            ...controllers.map((controller) => TextFormFiledStepper(
                  labelname: "Step$counter",
                  textEditingController: controller,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addTextField,
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: _removeTextField,
                ),
              ],
            ),
            ButtonText(
                text: 'Save',
                onPressed: () {
                  final model = TretmentPlanModel(controles: controllers);
                  widget.planControle.listofModel.add(model);
                  Navigator.pop(context, 'refresh');
                })
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }
}
