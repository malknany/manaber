import 'package:flutter/material.dart';
import 'package:manaber/features/file_assa/stpper/view.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/colors.dart';

class FileAssassemntScreen extends StatefulWidget {
  const FileAssassemntScreen({super.key});

  @override
  State<FileAssassemntScreen> createState() => _FileAssassemntScreenState();
}

class _FileAssassemntScreenState extends State<FileAssassemntScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateTo(context, FileStteper());
          },
          child: Icon(Icons.edit_outlined),
          backgroundColor: AppColors.primarycolor,
          elevation: 0),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //! somthing wrong in photo
              Image.asset('assets/images/logo.png'),
              const Text(
                "File Assessment",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "All information about Patient",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.normal),
              ),
              ButtonText(
                  text: 'Patient Information',
                  onPressed: () {},
                  borderRadius: 7),
              ButtonText(
                  text: 'ICF Body function And structure',
                  onPressed: () {},
                  borderRadius: 7),
              ButtonText(
                  text: '(Participation And Participation Restriction)',
                  onPressed: () {},
                  borderRadius: 7),
              ButtonText(text: 'Goals', onPressed: () {}, borderRadius: 7),
              ButtonText(text: 'Note', onPressed: () {}, borderRadius: 7),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        foregroundColor: AppColors.primarycolor,
        backgroundColor: Colors.white,
        // title: const Text(
        //   "File Assessment",
        //   style: TextStyle(
        //       fontSize: 20,
        //       color: Colors.white,
        //       fontFamily: 'Schyler',
        //       fontWeight: FontWeight.bold),
        // ),
        // centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
