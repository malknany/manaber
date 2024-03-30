import 'package:flutter/material.dart';
import '../../../../../shared/components/components.dart';
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
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: List.generate(
              modelXray.urls.length,
              (index) => InteractiveViewer(
                  child: NetworkImageCustom(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height / 2,
                imageUrl: modelXray.urls[index],
                fit: BoxFit.cover,
              )
                  // Image.network(
                  //   loadingBuilder: (BuildContext context, Widget child,
                  //       ImageChunkEvent? loadingProgress) {
                  //     if (loadingProgress == null) return child;
                  //     return const Center(
                  //       child: CircularProgressIndicator(
                  //         color: AppColors.primaryColor,
                  //       ),
                  //     );
                  //   },
                  //   errorBuilder: (context, error, stackTrace) {
                  //     return Text(error.toString());
                  //   },
                  //   modelXray.urls[index],
                  //   fit: BoxFit.cover,
                  // ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
