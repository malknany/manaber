import 'package:flutter/material.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class Rom extends StatefulWidget {
  const Rom({super.key});

  @override
  State<Rom> createState() => _RomState();
}

class _RomState extends State<Rom> {
  final TextEditingController controller1 = TextEditingController();

  String hip = '';

  String hip1 = '';

  String hip2 = '';

  String hip3 = '';

  String hip4 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Rom'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButtonItem(
                controller: controller1,
                lableName: 'Hip',
                itemList: const ['restricted', 'Normal', 'hyper', 'flexibility'],
              ),
              DropdownButtonItem(
                  controller: controller1,
                  lableName: 'knee',
                  itemList: const ['restricted', 'Normal', 'hyper', 'flexibility']),
              DropdownButtonItem(
                  controller: controller1,
                  lableName: 'Ankle',
                  itemList: const ['restricted', 'Normal', 'hyper', 'flexibility']),
              DropdownButtonItem(
                controller: controller1,
                  lableName: 'shoulder',
                  itemList: const ['restricted', 'Normal', 'hyper', 'flexibility']),
               DropdownButtonItem(
                 controller: controller1,
                  lableName: 'elbow',
                  itemList: const ['restricted', 'Normal', 'hyper', 'flexibility']),
              TextFormFiledStepper(
                  labelname: 'Note', textEditingController: controller1),
            ],
          ),
        ),
      ),
    );
  }
}
