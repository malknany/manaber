import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/profile_pationt/x-ray/cubit/xray_cubit.dart';
import 'package:manaber/features/doctor/profile_pationt/x-ray/widget/item_car_xray.dart';
import 'package:manaber/features/doctor/profile_pationt/x-ray/widget/selcte_photo.dart';

import 'widget/data_view_entry.dart';
import '../../../../shared/styles/colors.dart';

import '../../../../shared/components/navigator.dart';
import '../../../../shared/styles/styles.dart';

class XrayView extends StatefulWidget {
  XrayView({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<XrayView> createState() => _XrayViewState();
}

class _XrayViewState extends State<XrayView> {
  @override
  void initState() {
    context.read<XrayCubit>().getImagesFromApi(widget.id);
    super.initState();
  }
  // bool isRefresh = false;
  // bool isDelete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         setState(() {
        //           isDelete = !isDelete;
        //         });
        //       },
        //       icon: const Icon(
        //         Icons.delete,
        //         color: AppColors.primarycolor,
        //       ))
        // ],
        title: const Text('X-ray'),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<XrayCubit, XrayState>(
        builder: (context, state) {
          if (state is XrayEmpty) {
            return Center(
              child: Text('No Xray Found ', style: AppTextStyles.smTitles),
            );
          }
          if (state is XrayLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primarycolor,
              ),
            );
          }
          if (state is XrayError) {
            return Center(
              child: Text(
                state.msg,
                style: AppTextStyles.lrTitles.copyWith(color: Colors.black),
              ),
            );
          }
          if (state is GetXraySuccess) {
            final model = state.listOfModleXray;
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: ListView.builder(
                itemCount: model.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemCardXray(
                    modelXray: model[index],
                    onDismissed: (p0) {
                      context.read<XrayCubit>().deleteImgesFromApi(
                            id: model[index].patientId,
                            idImage: model[index].id,
                            model[index].urls,
                          );
                    },
                    name: 'X-ray${index + 1}',
                    onTap: () {
                      navigateTo(
                          context,
                          XrayDataView(
                            modelXray: model[index],
                          ));
                    },
                  );
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      //
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primarycolor,
        onPressed: () async {
          final result = await navigateTo(
              context,
              BlocProvider(
                create: (context) => XrayCubit(),
                child: SlectePhotoView(
                  id: widget.id,
                ),
              ));
          if (result == 'refrech') {
            BlocProvider.of<XrayCubit>(context).getImagesFromApi(widget.id);
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

// isRefresh
//     ? Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 1.0,
//             crossAxisSpacing: 20,
//           ),
//           itemCount: widget.controle.itemes.length,
//           itemBuilder: (context, index) => Stack(
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   navigateTo(
//                       context,
//                       XrayDataView(
//                         modelXray: widget.controle.itemes[index],
//                       ));
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: Material(
//                     shadowColor: AppColors.primarycolor,
//                     elevation: 10,
//                     borderRadius: BorderRadius.circular(20),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       height: MediaQuery.sizeOf(context).height / 4,
//                       width: MediaQueryHelper.sizeFromWidth(context, 1.2),
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Center(
//                               child: Text(
//                                 "X_ray${index + 1}",
//                                 style: AppTextStyles.lrTitles.copyWith(
//                                     color: AppColors.primarycolor),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               isDelete
//                   ? Align(
//                       alignment: Alignment.topRight,
//                       child: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             widget.controle.itemes.removeAt(index);
//                           });
//                         },
//                         icon: const Icon(
//                           Icons.delete,
//                           color: Colors.red,
//                         ),
//                       ),
//                     )
//                   : const SizedBox.shrink(),
//             ],
//           ),
//         ),
//       )
//     : const SizedBox(
//         height: double.infinity,
//         width: double.infinity,
//         child: Center(
//           child: Text("No X-ray",
//               style:
//                   TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
//         ),
//       ),
