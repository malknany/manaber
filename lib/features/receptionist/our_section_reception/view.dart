import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/receptionist/insert_data/cubit/reception_cubit.dart';
import 'package:manaber/features/receptionist/insert_data/view.dart';
import 'package:manaber/shared/styles/colors.dart';
import '../receptionist_profile/profile/cubit/receptionist_profile_cubit.dart';
import '../receptionist_profile/profile/view.dart';
import '../../../shared/network/local/const_key.dart';

import '../../../shared/components/navigator.dart';
import '../../../shared/styles/styles.dart';
import '../insert_data/controler.dart';

class OurSectiosnReceptionist extends StatefulWidget {
  const OurSectiosnReceptionist({
    Key? key,
  }) : super(key: key);

  @override
  State<OurSectiosnReceptionist> createState() => _OurSectiosnReceptionistState();
}

class _OurSectiosnReceptionistState extends State<OurSectiosnReceptionist> {
  final StepperReceptionist controleReceptionist = StepperReceptionist();

  // final UsersModel usersModel;
  int _selectedIndex =0;
  List<String> departments=[AppConstKey.physicalTherapy,AppConstKey.occupationalTherapy,AppConstKey.speechTherapy];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                navigateTo(
                    context,
                    BlocProvider(
                      create: (context) => ReceptionistProfileCubit(),
                      child: const ReceptionistProfileScreen(),
                    ));
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedLabelTextStyle:  AppTextStyles.lrTitles.copyWith(
                            color: AppColors.primarycolor, fontSize: 15),
            minWidth: 100,
            indicatorColor: AppColors.primarycolor,
            selectedIconTheme: const IconThemeData(color: AppColors.primarycolor),
            unselectedIconTheme: const IconThemeData(color: AppColors.grey),
          
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
                print(departments[_selectedIndex]);
              });
            },
            destinations:  [
              NavigationRailDestination(
                icon: const Icon(Icons.looks_one_rounded),
                label: const SizedBox.shrink(),
                selectedIcon: Text('العلاج الطبيعي',style: AppTextStyles.lrTitles.copyWith(
                            color: AppColors.primarycolor, fontSize: 15),),
                
              ),
               NavigationRailDestination(
                icon: const Icon(Icons.looks_two),
                label: const SizedBox.shrink(),
                selectedIcon:Text('العلاج الوظيفي',style: AppTextStyles.lrTitles.copyWith(
                            color: AppColors.primarycolor, fontSize: 15),),
              ),
               NavigationRailDestination(
                icon: const Icon(Icons.looks_3),
                label: const SizedBox.shrink(),
                selectedIcon: Text('تعديل سلوك',style: AppTextStyles.lrTitles.copyWith(
                            color: AppColors.primarycolor, fontSize: 15),),
              ),
            ],
          ),
          const VerticalDivider(thickness: 0.5, width: 1),
          Expanded(
            child: BlocProvider(
            create: (context) => ReceptionCubit(),
            child: ReceptionistDataEntry(
              controleReceptionist: controleReceptionist,
              department: departments[_selectedIndex],
            ),
            ),
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Text('أقسامنا',
          //         style: AppTextStyles.lrTitles.copyWith(fontSize: 32)),
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         SectionItemReceptionist(
          //             department: AppConstKey.physicalTherapy,
          //             image: AppImages.login1,
          //             sectionname: 'العلاج الطبيعي',
          //             controleReceptionist: controleReceptionist),
          //         SectionItemReceptionist(
          //             department: AppConstKey.occupationalTherapy,
          //             image: AppImages.signup1,
          //             sectionname: 'العلاج الوظيفي',
          //             controleReceptionist: controleReceptionist),
          //         SectionItemReceptionist(
          //           department: AppConstKey.speechTherapy,
          //           image: AppImages.conversational1,
          //           sectionname: 'تعديل سلوك',
          //           controleReceptionist: controleReceptionist,
          //         )
          //       ],
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
