import 'package:flutter/material.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/images.dart';

class PatientItem extends StatelessWidget {
  const PatientItem(
      {super.key, required this.patientName, required this.onTap, this.onPressed});
  final String patientName;
  final void Function()? onPressed;
  final void Function()? onTap;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: AppColors.grey,
            offset: Offset(8, 8),
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        hoverColor: Colors.transparent,
        trailing:IconButton(onPressed: onPressed, icon: const Icon(Icons.delete,color: Colors.red,)) ,
        onTap: onTap,
        selected: true,
        selectedColor: Colors.grey,
        contentPadding: const EdgeInsets.all(8),
        title: Text(
          patientName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Color(0xff130B32),
          ),
        ),
        leading: Image.asset(AppImages.user),
      ),
    );
  }
}

// final token = CacheHelper.getData(key: AppConstKey.token);
//  deleteUser(
//     id,
//   ) async {
//     final response = await DioHelper.deletedata(
//         url: deletePatient + id,
//         headers: {'Authorization': 'Bearer ${token[0]}'});
//     debugPrint(response.data);
//     debugPrint(response.statusCode.toString());
//     if (response.statusCode == 204) {
//       return true;
//     } else {
//       debugPrint(response.data);
//       return response.data['massge'];
//     }
//   }

// _showPopupMenu(context) {
//     final RenderObject? overlay = Overlay.of(context).context.findRenderObject();
//     showMenu(
//       position: ,
//       context: context,
//       // position: RelativeRect.fromRect(
      
//       //   longPressRecognizer.longPressRect,
//       //   Offset.zero & overlay!.semanticBounds.size,
//       // ),
//       items: <PopupMenuEntry>[
//         const PopupMenuItem(
//           value: 'delete',
//           child: Row(
//             children: <Widget>[
//               Icon(Icons.delete),
//               SizedBox(width: 10),
//               Text('Delete'),
//             ],
//           ),
//         ),
//       ],
//       elevation: 8.0,
//     ).then((value) {
//       if (value == 'delete') {
//         // Perform delete action here
//       }
//     });
//   }