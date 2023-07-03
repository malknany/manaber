import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/profile_pationt/profile_view/widget/slection_item_profile.dart';

class ProfilePationtScreen extends StatefulWidget {
  const ProfilePationtScreen({super.key});

  @override
  State<ProfilePationtScreen> createState() => _ProfilePationtScreenState();
}

class _ProfilePationtScreenState extends State<ProfilePationtScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient profile'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 30),
              itemCount: profile.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return SlectedItemProfile(sectionname: profile[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}

List<String> profile = [
  'File assessment',
  'Treatment plan',
  'x-rays',
  'videos'
];
