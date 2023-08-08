import 'package:flutter/material.dart';
import '../../../../../shared/styles/colors.dart';
import '../model.dart';

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
              itemCount: modelXray.urls.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primarycolor,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Text(error.toString());
                  },
                  modelXray.urls[index],
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
