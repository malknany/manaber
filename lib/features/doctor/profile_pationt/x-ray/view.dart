import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/profile_pationt/x-ray/widget/selcte_photo.dart';
import 'controle.dart';
import 'widget/data_view_entry.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/components/navigator.dart';
import '../../../../shared/styles/styles.dart';

class XrayView extends StatefulWidget {
  XrayView({
    super.key,
    required this.id,
  });
  final ControleXray controle = ControleXray();
  final id;

  @override
  State<XrayView> createState() => _XrayViewState();
}

class _XrayViewState extends State<XrayView> {
  bool isRefresh = false;
  bool isDelete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isDelete = !isDelete;
                });
              },
              icon: const Icon(
                Icons.delete,
                color: AppColors.primarycolor,
              ))
        ],
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
                itemBuilder: (context, index) => Stack(
                  children: [
                    GestureDetector(
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
                            width: MediaQueryHelper.sizeFromWidth(context, 1.2),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "X_ray${index + 1}",
                                      style: AppTextStyles.lrTitles.copyWith(
                                          color: AppColors.primarycolor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    isDelete
                        ? Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.controle.itemes.removeAt(index);
                                });
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
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
        onPressed: () async {
          final result = await navigateTo(
              context, SlectePhotoView(controle: widget.controle,id:widget.id ,));
          if (result == 'refresh') {
            setState(() {
              isRefresh = true;
            });
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
