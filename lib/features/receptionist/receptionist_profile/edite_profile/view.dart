import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/receptionist/receptionist_profile/edite_profile/cubit/edite_profile_cubit.dart';
import 'package:manaber/models/profile.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/styles.dart';

import '../../../../shared/components/components.dart';

class EditeProfileReceptionist extends StatelessWidget {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final ModelProfile modelReceptionistProfile;

  EditeProfileReceptionist({
    required this.modelReceptionistProfile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, 'refrech');
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
        title: const Text('تعديل بيانات الطبيب'),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              TextFormFiledStepper(
                  textDirection: TextDirection.rtl,
                  textEditingController: controllerName,
                  labelname: modelReceptionistProfile.name),
              TextFormFiledStepper(
                  textDirection: TextDirection.rtl,
                  textEditingController: controllerPassword,
                  labelname: 'كلمة السر'),
              ButtonText(
                  text: 'حفظ',
                  onPressed: () {
                    context.read<EditeProfileCubit>().postEditeProfile(
                        name: controllerName.text,
                        password: controllerPassword.text);
                  }),
              BlocBuilder<EditeProfileCubit, EditeProfileState>(
                builder: (context, state) {
                  if (state is EditeProfileLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primarycolor,
                      ),
                    );
                  }
                  if (state is EditeProfileSuccess) {
                    return Center(
                      child: Text(
                        'تم تعديل البيانات ',
                        textDirection: TextDirection.rtl,
                        style: AppTextStyles.lrTitles.copyWith(
                            color: AppColors.primarycolor, fontSize: 15),
                      ),
                    );
                  }
                  if (state is EditeProfileError) {
                    return Text(
                      state.msg,
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.lrTitles
                          .copyWith(color: Colors.red, fontSize: 15),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
