import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/profile_pationt/x-ray/model.dart';

class XrayDataView extends StatelessWidget {
  const XrayDataView({super.key, required this.modelXray});
  final ModelXray modelXray;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('X-Ray'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: modelXray.images.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.file(
                  modelXray.images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
