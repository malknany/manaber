// import 'package:flutter/material.dart';

// class MyScreen extends StatefulWidget {
//   @override
//   _MyScreenState createState() => _MyScreenState();
// }

// class _MyScreenState extends State<MyScreen> {
//   List<Widget> _textFields = [];

//   @override
//   void initState() {
//     super.initState();
//     _textFields.add(TextFormField());
//   }

//   void _addTextField() {
//     setState(() {
//       _textFields.add(TextFormField());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Screen'),
//       ),
//       body: ListView(
//         children: [
//           ..._textFields,
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: _addTextField,
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:manaber/shared/components/components.dart';

// class MyScreen extends StatefulWidget {
//   @override
//   _MyScreenState createState() => _MyScreenState();
// }

// class _MyScreenState extends State<MyScreen> {
//   List<TextEditingController> _controllers = [];
//   int counter = 1;

//   @override
//   void initState() {
//     super.initState();
//     _controllers.add(TextEditingController());
//   }

//   void _addTextField() {
//     setState(() {
//       _controllers.add(TextEditingController());
//     });
//     counter++;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Screen'),
//       ),
//       body: ListView(
//         children: [
//           ..._controllers.map((controller) => TextFormFiledStepper(
//                 labelname: "plan$counter",
//                 textEditingController: controller,
//               )),
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: _addTextField,
//           ),
//         ],
//       ),
//     );
//   }

// ignore_for_file: library_private_types_in_public_api

//   @override
//   void dispose() {
//     _controllers.forEach((controller) => controller.dispose());
//     super.dispose();
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:manaber/shared/components/components.dart';

// class HomeScreen extends StatefulWidget {
//   final List<String> data;

//   const HomeScreen({super.key, required this.data});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Screen'),
//       ),
//       body: ListView.builder(
//         itemCount: widget.data.length,
//         itemBuilder: (context, index) => Card(
//           child: ListTile(
//             title: Text(widget.data[index]),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) =>
//                         DataScreen(data: widget.data, selectedIndex: index)),
//               );
//             },
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const MyScreen()),
//           );
//         },
//       ),
//     );
//   }
// }

// class DataScreen extends StatelessWidget {
//   final List<String> data;
//   final int selectedIndex;

//   const DataScreen({super.key, required this.data, required this.selectedIndex});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Data Screen'),
//       ),
//       body: ListView.builder(
//         itemCount: data.length,
//         itemBuilder: (context, index) => ListTile(
//           title: Text(data[index]),
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) =>
//                       FormScreen(data: data, selectedIndex: index)),
//             );
//           },
//           selected: selectedIndex == index,
//         ),
//       ),
//     );
//   }
// }

// class MyScreen extends StatefulWidget {
//   const MyScreen({super.key});

//   @override
//   _MyScreenState createState() => _MyScreenState();
// }

// class _MyScreenState extends State<MyScreen> {
//   final List<TextEditingController> _controllers = [];
//   int counter = 1;

//   @override
//   void initState() {
//     super.initState();
//     _controllers.add(TextEditingController());
//   }

//   void _addTextField() {
//     setState(() {
//       _controllers.add(TextEditingController());
//     });
//     counter++;
//   }

//   void _removeTextField() {
//     setState(() {
//       _controllers.removeLast();
//     });
//     counter--;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Screen'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//         child: ListView(
//           children: [
//             ..._controllers.map((controller) => TextFormFiledStepper(
//                   labelname: "plan$counter",
//                   textEditingController: controller,
//                 )),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.add),
//                   onPressed: _addTextField,
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.remove),
//                   onPressed: _removeTextField,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }
// }

// class FormScreen extends StatefulWidget {
//   const FormScreen({super.key, required this.data, this.selectedIndex});
//   final List<String> data;
//   final int? selectedIndex;

//   @override
//   _FormScreenState createState() => _FormScreenState();
// }

// class _FormScreenState extends State<FormScreen> {
//   final TextEditingController _controller = TextEditingController();
//   late String _currentValue;

//   @override
//   void initState() {
//     super.initState();
//     _currentValue =
//         widget.selectedIndex != null ? widget.data[widget.selectedIndex!] : '';
//     _controller.text = _currentValue;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Form Screen'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextFormField(
//               controller: _controller,
//               onChanged: (value) => _currentValue = value,
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               child: const Text('Save'),
//               onPressed: () {
//                 if (widget.selectedIndex != null) {
//                   widget.data[widget.selectedIndex!] = _currentValue;
//                 } else {
//                   widget.data.add(_currentValue);
//                 }
//                 Navigator.popUntil(context, ModalRoute.withName('/'));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:manaber/shared/styles/colors.dart';

class NumberTable extends StatefulWidget {
  const NumberTable({super.key});

  @override
  State<NumberTable> createState() => _NumberTableState();
}

class _NumberTableState extends State<NumberTable> {
  String selectedValue = 'Option 1';
  String male = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                CustomDropdownButton6(
                  value: male,
                  dropdownItems: const ["Male", "Femal"],
                  onChanged: (value) {
                    setState(() {
                      male = value!;
                    });
                  },
                ),
                CustomDropdownButton6(
                  value: male,
                  dropdownItems: const ["Male", "Femal"],
                  onChanged: (value) {
                    setState(() {
                      male = value!;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomDropdownButton2 extends StatelessWidget {
  const CustomDropdownButton2({
    this.hint,
    this.initialValue,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = Offset.zero,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textDirection = TextDirection.ltr,
    super.key,
  });
  final String? hint;
  final String? initialValue;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(
            "$hint :",
            textDirection: textDirection,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              value: value,
              items: dropdownItems
                  .map((String item) => DropdownMenuItem<String>(
                        alignment: Alignment.bottomLeft,
                        value: item,
                        child: Container(
                          alignment: valueAlignment,
                          child: Text(
                            item,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: onChanged,
              selectedItemBuilder: selectedItemBuilder,
              buttonStyleData: ButtonStyleData(
                height: buttonHeight ?? 60,
                width: double.infinity,
                padding: buttonPadding ??
                    const EdgeInsets.only(
                      left: 14,
                      right: 14,
                    ),
                decoration: buttonDecoration ??
                    BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColors.primarycolor,
                        width: 2,
                      ),
                    ),
                elevation: 0,
              ),
              iconStyleData: IconStyleData(
                icon: icon ??
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                iconSize: iconSize ?? 12,
                iconEnabledColor: iconEnabledColor,
                iconDisabledColor: iconDisabledColor,
              ),
              dropdownStyleData: DropdownStyleData(
                //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
                maxHeight: dropdownHeight ?? 200,
                width: dropdownWidth ?? 250,
                padding: dropdownPadding,
                decoration: dropdownDecoration ??
                    BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                elevation: dropdownElevation ?? 8,
                //Null or Offset(0, 0) will open just under the button. You can edit as you want.
                offset: offset,
                scrollbarTheme: ScrollbarThemeData(
                  radius: scrollbarRadius ?? const Radius.circular(5),
                  thickness: scrollbarThickness != null
                      ? MaterialStateProperty.all<double>(scrollbarThickness!)
                      : null,
                  thumbVisibility: scrollbarAlwaysShow != null
                      ? MaterialStateProperty.all<bool>(scrollbarAlwaysShow!)
                      : null,
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                height: itemHeight ?? 40,
                padding:
                    itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDropdownButton6 extends StatelessWidget {
  const CustomDropdownButton6({
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = Offset.zero,
    super.key,
  });

  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        //To avoid long text overflowing.
        isExpanded: true,
        value: value,
        items: dropdownItems
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Container(
                    alignment: valueAlignment,
                    child: Text(
                      item,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ))
            .toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        buttonStyleData: ButtonStyleData(
          height: buttonHeight ?? 40,
          width: buttonWidth ?? 140,
          padding: buttonPadding ?? const EdgeInsets.only(left: 14, right: 14),
          decoration: buttonDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black45,
                ),
              ),
          elevation: buttonElevation,
        ),
        iconStyleData: IconStyleData(
          icon: icon ?? const Icon(Icons.arrow_forward_ios_outlined),
          iconSize: iconSize ?? 12,
          iconEnabledColor: iconEnabledColor,
          iconDisabledColor: iconDisabledColor,
        ),
        dropdownStyleData: DropdownStyleData(
          //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
          maxHeight: dropdownHeight ?? 200,
          width: dropdownWidth ?? 140,
          padding: dropdownPadding,
          decoration: dropdownDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
          elevation: dropdownElevation ?? 8,
          //Null or Offset(0, 0) will open just under the button. You can edit as you want.
          offset: offset,
          scrollbarTheme: ScrollbarThemeData(
            radius: scrollbarRadius ?? const Radius.circular(40),
            thickness: scrollbarThickness != null
                ? MaterialStateProperty.all<double>(scrollbarThickness!)
                : null,
            thumbVisibility: scrollbarAlwaysShow != null
                ? MaterialStateProperty.all<bool>(scrollbarAlwaysShow!)
                : null,
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: itemHeight ?? 40,
          padding: itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
