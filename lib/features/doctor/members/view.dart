import 'package:flutter/material.dart';
import 'package:manaber/shared/styles/images.dart';
import 'model.dart';
import '../profile_pationt/profile_view/view.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/colors.dart';

class Members extends StatefulWidget {
  const Members({Key? key, required this.counter}) : super(key: key);
  final int counter;

  @override
  State<Members> createState() => _MembersState();
}

class _MembersState extends State<Members> {
  List<Model> display_list = List.from(mainList);

  void UploadList(String value) {
    setState(() {
      display_list = mainList
          .where((element) =>
              element.title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) => UploadList(value),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: AppColors.primarycolor)),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.primarycolor),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: "أدخل الاسم..",
                      prefixIcon: const Icon(Icons.search,
                          color: AppColors.primarycolor),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: display_list.isEmpty
                    ? const Center(
                        child: Text("No Result Founded",
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff130B32))))
                    : ListView.separated(
                        itemCount: display_list.length,
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                    color: AppColors.grey,
                                    offset: Offset(8, 8),
                                    blurRadius: 10)
                              ]),
                          child: ListTile(
                            onTap: () {
                              navigateTo(
                                  context,
                                  ProfilePationtScreen(
                                    index: widget.counter,
                                  ));
                            },
                            selected: true,
                            selectedColor: Colors.grey,
                            contentPadding: const EdgeInsets.all(8),
                            title: Text(
                              display_list[index].title!,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff130B32)),
                            ),
                            leading: Image.asset(AppImages.user),
                          ),
                        ),
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 30,
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
