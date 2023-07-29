import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/profile_doctor/edite_profile/cubit/edite_profile_doctor_cubit.dart';
import 'package:manaber/models/profile.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/styles.dart';
import '../../../../shared/components/components.dart';

class EditeProfileDoctorScreen extends StatelessWidget {
  final TextEditingController controllerName = TextEditingController();

  final TextEditingController controllerPassword = TextEditingController();
  final ModelProfile modelProfileDoctor;
  final _formKey = GlobalKey<FormState>();

  EditeProfileDoctorScreen({
    required this.modelProfileDoctor,
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
          ),
        ),
        title: const Text('تعديل بيانات الطبيب'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    textEditingController: controllerName,
                    labelname: modelProfileDoctor.name),
                TextFormFiledStepper(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'يرجى إدخال كلمة المرور';
                      }
                      if (value.length < 6) {
                        return 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل';
                      }
                      if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$')
                          .hasMatch(value)) {
                        return 'يجب أن تحتوي كلمة المرور على حرف كبير وحرف صغير ورقم واحد على الأقل';
                      }
                      return null;
                    },
                    textDirection: TextDirection.rtl,
                    textEditingController: controllerPassword,
                    labelname: 'كلمة السر'),
                ButtonText(
                    text: 'حفظ',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context
                            .read<EditeProfileDoctorCubit>()
                            .postEditeProfile(
                                name: controllerName.text,
                                password: controllerPassword.text);
                      }
                    }),
                BlocBuilder<EditeProfileDoctorCubit, EditeProfileDoctorState>(
                  builder: (context, state) {
                    if (state is EditeProfileDoctorLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primarycolor,
                        ),
                      );
                    }
                    if (state is EditeProfileDoctorSuccess) {
                      return Center(
                        child: Text(
                          'تم تعديل البيانات ',
                          textDirection: TextDirection.rtl,
                          style: AppTextStyles.lrTitles.copyWith(
                              color: AppColors.primarycolor, fontSize: 15),
                        ),
                      );
                    }
                    if (state is EditeProfileDoctorError) {
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
      ),
    );
  }
}
