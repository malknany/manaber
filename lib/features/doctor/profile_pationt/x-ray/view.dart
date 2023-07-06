import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/profile_pationt/x-ray/controle.dart';
import 'package:manaber/features/doctor/profile_pationt/x-ray/widget/data_view_entry.dart';
import 'package:manaber/features/doctor/profile_pationt/x-ray/widget/selcte_photo.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/components/constants.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/styles.dart';

class XrayView extends StatefulWidget {
  XrayView({
    super.key,
  });
  final ControleXray controle = ControleXray();

  @override
  State<XrayView> createState() => _XrayViewState();
}

class _XrayViewState extends State<XrayView> {
  bool isRefresh = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('X-ray'),
        backgroundColor: Colors.white,
      ),
      body: isRefresh
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: widget.controle.itemes.length,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          navigateTo(
                              context,
                              XrayDataView(
                                modelXray: widget.controle.itemes[index],
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Material(
                            shadowColor: AppColors.primarycolor,
                            elevation: 10,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: MediaQuery.sizeOf(context).height / 4,
                              width:
                                  MediaQueryHelper.sizeFromWidth(context, 1.2),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "X_ray${index + 1}",
                                      style: AppTextStyles.lrTitles.copyWith(
                                          color: AppColors.primarycolor),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: IconButton(
                                        onPressed: () {
                                          widget.controle.itemes
                                              .removeAt(index);
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
            )
          : const SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Text("No X-ray",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primarycolor,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          final refresh = await navigateTo(
              context, SlectePhotoView(controle: widget.controle));

          if (refresh == 'refresh') {
            setState(() {
              isRefresh = true;
            });
          }
        },
      ),
    );
  }
}
