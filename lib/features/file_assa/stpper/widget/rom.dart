import 'package:flutter/material.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class Rom extends StatelessWidget {
  Rom({super.key});

  final TextEditingController controller1 = TextEditingController();

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
              const DropdownButtonItem(
                  lableName: 'Hip',
                  itemList: ['restricted', 'Normal', 'hyper', 'flexibility']),
              const DropdownButtonItem(
                  lableName: 'knee',
                  itemList: ['restricted', 'Normal', 'hyper', 'flexibility']),
              const DropdownButtonItem(
                  lableName: 'Ankle',
                  itemList: ['restricted', 'Normal', 'hyper', 'flexibility']),
              const DropdownButtonItem(
                  lableName: 'shoulder',
                  itemList: ['restricted', 'Normal', 'hyper', 'flexibility']),
              const DropdownButtonItem(
                  lableName: 'elbow',
                  itemList: ['restricted', 'Normal', 'hyper', 'flexibility']),
              TextFormFiledStepper(
                  labelname: 'Note', textEditingController: controller1),
            ],
          ),
        ),
      ),
    );
  }
}
