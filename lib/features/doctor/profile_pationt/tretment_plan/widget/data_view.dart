import 'package:flutter/material.dart';
import '../model.dart';
import '../../../../../shared/components/components.dart';

class DataView extends StatelessWidget {
  const DataView({super.key, required this.controle, required this.index});
  final TretmentPlanModel controle;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('plan$index'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
                children: List.generate(
              controle.controles.length,
              (index) => InfoRowItem(
                  title: 'Step${index + 1}',
                  value: controle.controles[index].text),
            )),
          ),
        ),
      ),
    );
  }
}
