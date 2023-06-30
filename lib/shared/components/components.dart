// import 'package:flutter/material.dart';

// import '../styles/colors.dart';
// import '../styles/styles.dart';
// import 'constants.dart';

// class ButtonTemplate extends StatelessWidget {
//   ButtonTemplate({
//     Key? key,
//     required this.color,
//     required this.text1,
//     required this.onPressed,
//     this.text2 = "",
//     this.text3 = "",
//     this.icon,
//     this.minwidth = 318,
//     this.minheight = 60,
//     this.fontSize = 18,
//   }) : super(key: key);
//   final Color color;
//   final String text1;
//   final String text2;
//   final String text3;
//   final double minwidth;
//   final double minheight;
//   final double fontSize;
//   final IconData? icon;
//   void Function()? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       minWidth: minwidth,
//       height: minheight,
//       onPressed: onPressed,
//       color: color,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Center(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             icon == null

//                 ? SizedBox()
//                 : Center(
//               child: Icon(icon, size: 21, color: AppColors.white),
//             ),
//             SizedBox(
//               width: 5,
//             ),

//             Center(
//               child: Text(text1,
//                   textAlign: TextAlign.center,
//                   style: AppTextStyles.boldtitlesButton.copyWith(
//                  fontSize: 17,
//                     color: AppColors.white,
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// /////////////////////////

import 'package:flutter/material.dart';
import 'package:manaber/shared/styles/colors.dart';

class TextFieldTemplate extends StatefulWidget {
  const TextFieldTemplate(
      {Key? key,
      required this.hintText,
      this.controller,
      this.validator,
      this.isPassword = false,
      this.suffixIcon,
      this.prefixIcon,
      this.textInputType = TextInputType.visiblePassword})
      : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final Function? validator;
  final Widget? suffixIcon;
  final bool isPassword;
  final Widget? prefixIcon;
  final TextInputType textInputType;

  @override
  State<TextFieldTemplate> createState() => _TextFieldTemplateState();
}

class _TextFieldTemplateState extends State<TextFieldTemplate> {
  // bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        obscureText: widget.isPassword,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              color: AppColors.grey,
              fontFamily: 'Schyler',
              fontWeight: FontWeight.normal),
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
        ),
      ),
    );
  }
}

class InfoRowItem extends StatelessWidget {
  const InfoRowItem({
    super.key,
    required this.columnWidth,
    required this.title,
    required this.value,
  });
  final double columnWidth;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: columnWidth,
              child: Text(
                '$title:',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                value,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          color: AppColors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}

class RowItemRightLeft extends StatelessWidget {
  const RowItemRightLeft({
    required this.right,
    required this.left,
    super.key,
    required this.columnWidth,
    required this.title,
  });
  final double columnWidth;
  final String title;
  final String left;
  final String right;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: columnWidth,
              child: Text(
                '$title:',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(children: [
                Text(
                  "Right",
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  right,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Column(children: [
                Text(
                  "Left",
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  left,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ]),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          color: AppColors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText(
      {super.key,
      required this.text,
      required this.onPressed,
      this.borderRadius = 16});
  final String text;
  final void Function()? onPressed;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(
            MediaQuery.of(context).size.width,
            50,
          ),
          elevation: 0,
          backgroundColor: AppColors.primarycolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'Schyler',
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class TextFormFiledStepper extends StatelessWidget {
  const TextFormFiledStepper(
      {super.key,
      required this.textEditingController,
      required this.labelname,
      this.textInputType = TextInputType.text});
  final String labelname;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: textEditingController,
        onSaved: (newValue) {
          textEditingController.text = newValue!;
        },
        cursorColor: AppColors.primarycolor,
        keyboardType: textInputType,
        smartQuotesType: SmartQuotesType.enabled,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: AppColors.primarycolor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: AppColors.primarycolor,
              width: 2,
            ),
          ),
          labelText: labelname,
          labelStyle:
              TextStyle(color: Colors.black.withOpacity(0.26), fontSize: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: AppColors.primarycolor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

class DividerItem extends StatelessWidget {
  const DividerItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.grey,
            thickness: 1,
          ),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
        const Expanded(
          child: Divider(
            color: AppColors.grey,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

class CustomDropdown extends StatefulWidget {
  final String hint;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    Key? key,
    required this.hint,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String? _selectedItem;

  @override
  void initState() {
    super.initState();
    // Read the value from the PageStorage for this widget's key
    _selectedItem = PageStorage.of(context).readState(context) as String?;
  }

  @override
  void dispose() {
    // Save the value to the PageStorage before disposing of the widget
    PageStorage.of(context).writeState(context, _selectedItem);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedItem,
      decoration: InputDecoration(
        hintText: widget.hint,
        border: const OutlineInputBorder(),
      ),
      items: widget.items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedItem = value;
        });
        widget.onChanged(value);
      },
    );
  }
}

class DropdownButtonItem extends StatefulWidget {
  final String lableName;
  final List<String> itemList;
  
  final TextEditingController controller;

  const DropdownButtonItem(
      {Key? key,
      required this.controller,
      required this.lableName,
      required this.itemList,
      })
      : super(key: key);

  @override
  _DropdownButtonItemState createState() => _DropdownButtonItemState();
}

class _DropdownButtonItemState extends State<DropdownButtonItem> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      onChanged: (value) {
        setState(() {
          _selectedItem = value!;
        });
        widget.controller.text = _selectedItem!;
      },
      padding: const EdgeInsets.symmetric(vertical: 5),
      isExpanded: true,
      iconEnabledColor: AppColors.primarycolor,
      value: _selectedItem,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.primarycolor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: AppColors.primarycolor,
              width: 2,
            )),
        labelText: widget.lableName,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.primarycolor,
            width: 2,
          ),
        ),
      ),
      items: widget.itemList.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }
}

// class DropdownButtonItem extends StatefulWidget {
//   const DropdownButtonItem({
//     super.key,
//     required this.lableName,
//     required this.itemList,
//   });
//   final String lableName;
//   final List<String> itemList;
//   // final TextEditingController textEditing;
//   @override
//   State<DropdownButtonItem> createState() => _DropdownButtonItemState();
// }

// class _DropdownButtonItemState extends State<DropdownButtonItem> {
//   String? _selectedGender;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       isExpanded: true,
//       iconEnabledColor: AppColors.primarycolor,
//       decoration: InputDecoration(
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(5),
//           borderSide: const BorderSide(
//             color: AppColors.primarycolor,
//             width: 2,
//           ),
//         ),
//         labelText: widget.lableName,
//         labelStyle:
//             TextStyle(color: Colors.black.withOpacity(0.26), fontSize: 20),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(5),
//           borderSide: const BorderSide(
//             color: AppColors.primarycolor,
//             width: 2,
//           ),
//         ),
//       ),
//       value: _selectedGender,
//       onChanged: (newValue) {
//         setState(() {
//           _selectedGender = newValue;
//           // widget.textEditing.text = _selectedGender!;
//         });
//       },
//       items: widget.itemList.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           // onTap: () => widget.textEditing.text = value,
//           value: value,
//           child: Text(
//             value,
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

class ShowBottomSheetItems extends StatefulWidget {
  const ShowBottomSheetItems(
      {super.key, required this.name, required this.contecnt});
  final String name;
  final Widget contecnt;

  @override
  State<ShowBottomSheetItems> createState() => _ShowBottomSheetItemsState();
}

class _ShowBottomSheetItemsState extends State<ShowBottomSheetItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          label: Text(widget.name),
          suffixIcon: IconButton(
              onPressed: () => showBottomSheetItem(context, widget.contecnt),
              icon: const Icon(
                Icons.add,
                color: AppColors.primarycolor,
              )),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: AppColors.primarycolor,
              width: 2,
            ),
          ),
          // labelText: 'Developmental Milestones ',
          labelStyle:
              TextStyle(color: Colors.black.withOpacity(0.26), fontSize: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: AppColors.primarycolor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

Future showBottomSheetItem(context, Widget content) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return content;
    },
  );
}
// class BottomText extends StatelessWidget {
//   const BottomText({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       child: RichText(
//           textAlign: TextAlign.center,
//           text: TextSpan(
//               text: "",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//               ),
//               children: [
//                 TextSpan(
//                     text: "FCIS - ",
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//                 TextSpan(text: "Facult of comuters \n and informatoin science"),
//               ])),
//     );
//   }
// }

// void showMyDialog(String _message, BuildContext context) async {
//   return await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           //  backgroundColor: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           contentPadding: EdgeInsets.zero,
//           title: Text("Error"),
//           content: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(_message),
//           ),
//           actions: [
//             Center(
//               child: TextButton(
//                   style: ButtonStyle(
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25.0),
//                           ))),
//                   onPressed: () {
//                     Navigator.pop(context, "ok");
//                   },
//                   child: const Text(
//                     "ok",
//                     style:
//                     TextStyle(color: AppColors.primarycolor, fontSize: 22),
//                   )),
//             )
//           ],
//         );
//       });
// }

// ///
// class NavigateToOption extends StatelessWidget {
//   NavigateToOption({Key? key, required this.name, required this.onPressed})
//       : super(key: key);
//   String name;
//   void Function()? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8.0),
//       child: SizedBox(
//         height: 70,
//         width: 320,
//         child: Material(
//           color: AppColors.materialGrey,
//           borderRadius: BorderRadius.circular(20),
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: 20,
//             ),
//             child: Row(
//               children: [
//                 Text(name,
//                     style:
//                     TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
//                 Spacer(),
//                 SizedBox(
//                   width: 40,
//                   height: 40,
//                   child: MaterialButton(
//                       padding: EdgeInsets.zero,
//                       color: AppColors.primarycolor,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Icon(
//                         Icons.arrow_forward,
//                         color: Colors.white,
//                       ),
//                       onPressed: onPressed),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TeamsName extends StatelessWidget {
//   TeamsName({Key? key, required this.name, required this.onPressed})
//       : super(key: key);
//   String name;

//   void Function()? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 10.0),
//       child: Container(
//         height: 100,
//         width: 1,
//         child: MaterialButton(
//             padding: EdgeInsets.all(10),
//             color: AppColors.materialGrey,
//             shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//             child: RichText(
//               text: TextSpan(
//                 text: 'Team ',
//                 style: AppTextStyles.w300.apply(
//                   color: Colors.black,
//                 ),
//                 children: <TextSpan>[
//                   TextSpan(text: name, style: AppTextStyles.lrTitles),
//                 ],
//               ),
//             ),
//             onPressed: onPressed),
//       ),
//     );
//   }
// }