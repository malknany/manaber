import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manaber/features/sample.dart';

import '../styles/colors.dart';
import '../styles/styles.dart';

class ButtonTemplate extends StatelessWidget {
  const ButtonTemplate({
    Key? key,
    required this.color,
    required this.text1,
    required this.onPressed,
    this.text2 = "",
    this.text3 = "",
    this.icon,
    this.minwidth = 318,
    this.minheight = 60,
    this.fontSize = 18,
  }) : super(key: key);
  final Color color;
  final String text1;
  final String text2;
  final String text3;
  final double minwidth;
  final double minheight;
  final double fontSize;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: minwidth,
      height: minheight,
      onPressed: onPressed,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon == null
                ? const SizedBox()
                : Center(
                    child: Icon(icon, size: 21, color: Colors.white),
                  ),
            const SizedBox(
              width: 5,
            ),
            Center(
              child: Text(text1,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.boldtitlesButton.copyWith(
                    fontSize: 17,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
// /////////////////////////

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
  final String? Function(String?)? validator;
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
        validator: widget.validator,
        controller: widget.controller,
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
    required this.title,
    required this.value,
    this.textDirection = TextDirection.ltr,
  });
  final TextDirection textDirection;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      textDirection: textDirection,
      children: [
        Row(
          textDirection: textDirection,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 2,
              child: Text(
                '$title:',
                textDirection: textDirection,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                value,
                softWrap: true,
                textDirection: textDirection,
                style: const TextStyle(
                  fontSize: 15,
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
    this.tilteRight = 'Right',
    this.titleLeft = 'Left',
    required this.right,
    required this.left,
    super.key,
    required this.title,
  });

  final String title;
  final String left;
  final String right;
  final String titleLeft;
  final String tilteRight;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 2,
              child: Text(
                '$title:',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(children: [
                Text(
                  titleLeft,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  left,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Column(children: [
                Text(
                  tilteRight,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  right,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 15,
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

class RightLeftTextFiled extends StatefulWidget {
  const RightLeftTextFiled({
    Key? key,
    required this.title,
    required this.controllerRight,
    required this.controllerLeft,
    this.onChangedRight,
    this.onChangedLeft,
    this.initialValueLeft,
    this.initialValueRight,
  }) : super(key: key);

  final String title;
  final String? initialValueLeft;
  final String? initialValueRight;
  final TextEditingController controllerRight;
  final TextEditingController controllerLeft;
  final void Function(String?)? onChangedRight;
  final void Function(String?)? onChangedLeft;

  @override
  _RightLeftTextFiledState createState() => _RightLeftTextFiledState();
}

class _RightLeftTextFiledState extends State<RightLeftTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Text(
                '${widget.title}:',
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              flex: 3,
              child: TextFormFiledStepper(
                maxLength: 4,
                textInputType: TextInputType.number,
                textEditingController: widget.controllerRight,
                labelname: "Right",
                initialValue: widget.initialValueRight,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              flex: 3,
              child: TextFormFiledStepper(
                textInputType: TextInputType.number,
                maxLength: 4,
                textEditingController: widget.controllerLeft,
                labelname: "Left",
                initialValue: widget.initialValueLeft,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        const Divider(
          color: AppColors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}

class RightLeftDropdownButton extends StatefulWidget {
  const RightLeftDropdownButton(
      {Key? key,
      required this.title,
      required this.customDropdownButtonLeft,
      required this.customDropdownButtonRight})
      : super(key: key);

  final String title;
  final Widget customDropdownButtonLeft;
  final Widget customDropdownButtonRight;

  @override
  _RightLeftDropdownButtonState createState() => _RightLeftDropdownButtonState();
}

class _RightLeftDropdownButtonState extends State<RightLeftDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Text(
                '${widget.title}:',
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(flex: 3, child: widget.customDropdownButtonLeft),
            const SizedBox(width: 16.0),
            Expanded(flex: 3, child: widget.customDropdownButtonRight),
          ],
        ),
        const SizedBox(height: 4.0),
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
            MediaQuery.sizeOf(context).height / 16,
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
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFormFiledStepper extends StatefulWidget {
  TextFormFiledStepper({
    super.key,
    required this.labelname,
    this.hintText,
    this.validator,
    this.initialValue,
    required this.textEditingController,
    this.onChanged,
    this.onSaved,
    this.maxLength,
    this.onFieldSubmitted,
    this.maxLengthEnforcement = MaxLengthEnforcement.enforced,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.textDirection = TextDirection.ltr,
  });

  final String labelname;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  late TextEditingController textEditingController;
  final TextDirection textDirection;
  final String? hintText;
  final void Function(String?)? onChanged;
  final void Function(String?)? onFieldSubmitted;
  final TextInputAction textInputAction;
  final void Function(String?)? onSaved;
  final int? maxLength;
  final MaxLengthEnforcement maxLengthEnforcement;

  @override
  State<TextFormFiledStepper> createState() => _TextFormFiledStepperState();
}

class _TextFormFiledStepperState extends State<TextFormFiledStepper> {
  @override
  void initState() {
    super.initState();
    widget.textEditingController.text = widget.initialValue ?? "";
    // widget.textEditingController=TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Directionality(
        textDirection: widget.textDirection,
        child: TextFormField(
          maxLengthEnforcement: widget.maxLengthEnforcement,
          maxLength: widget.maxLength,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          validator: widget.validator,
          maxLines: 4,
          minLines: 1,
          controller: widget.textEditingController,
          onFieldSubmitted: widget.onFieldSubmitted,
          onSaved: widget.onSaved,
          cursorColor: AppColors.primarycolor,
          keyboardType: widget.textInputType,
          decoration: InputDecoration(
            alignLabelWithHint: true,
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
            labelText: widget.labelname,
            labelStyle: TextStyle(
              color: Colors.black.withOpacity(0.26),
              fontSize: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: AppColors.primarycolor,
                width: 2,
              ),
            ),
            hintText: widget.hintText,
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

class DropdownButtonItem extends StatefulWidget {
  const DropdownButtonItem({
    Key? key,
    required this.labelName,
    required this.itemList,
    required this.controller,
    this.onChanged,
    this.textDirection = TextDirection.ltr,
    this.alignment = Alignment.centerLeft,
    this.floatingLabelAlignment = FloatingLabelAlignment.center,
    // required this.valueChangedCallback, // New callback function
  }) : super(key: key);

  final String labelName;
  final List<String> itemList;
  final TextEditingController controller;
  final TextDirection textDirection;
  final FloatingLabelAlignment floatingLabelAlignment;
  final AlignmentGeometry? alignment;
  final void Function(String?)? onChanged;
  // final ValueChanged<String?> valueChangedCallback; // New callback function

  @override
  State<DropdownButtonItem> createState() => _DropdownButtonItemState();
}

class _DropdownButtonItemState extends State<DropdownButtonItem> {
  @override
  void initState() {
    super.initState();
    widget.controller.text = widget.controller.text.isEmpty
        ? widget.itemList.first
        : widget.controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.textDirection,
      child: DropdownButtonFormField<String>(
        focusColor: Colors.transparent,
        elevation: 0,
        onChanged: widget.onChanged,
        // onChanged: (value) {
        //   widget.controller.text = value!;
        // },
        padding: const EdgeInsets.symmetric(vertical: 10),
        isExpanded: true,
        iconEnabledColor: AppColors.primarycolor,
        decoration: InputDecoration(
          floatingLabelAlignment: widget.floatingLabelAlignment,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: AppColors.primarycolor,
              width: 2,
            ),
          ),
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: AppColors.primarycolor,
              width: 2,
            ),
          ),
          labelText: widget.labelName,
          labelStyle:
              TextStyle(color: Colors.black.withOpacity(0.26), fontSize: 20),
        ),
        value: widget.controller.text,
        items: widget.itemList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              alignment: widget.alignment,
              child: Text(
                // textDirection: widget.textDirection,
                value,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

Future showDialogItem(context, Widget content) {
  return showDialog(
    context: context,
    builder: (context) => Dialog.fullscreen(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Expanded(child: content),
        ],
      ),
    ),
  );
}

Future showBottomSheetItem(context, Widget content) {
  return 
  showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    context: context,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.8,
        builder: (context, scrollController) =>
            SingleChildScrollView(controller: scrollController, child: content),
      );
    },
  );
}

// class ShowBottomSheetItems extends StatelessWidget {
//   const ShowBottomSheetItems(
//       {super.key, required this.contecnt, required this.name});
//   final Widget contecnt;
//   final String name;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: ListTile(
//         shape: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(5),
//           borderSide: const BorderSide(
//             width: 2,
//             color: AppColors.primarycolor,
//           ),
//         ),
//         title: Text(
//           name,
//           style: TextStyle(color: Colors.black.withOpacity(0.26), fontSize: 20),
//         ),
//         trailing: IconButton(
//           // onPressed: () => showBottomSheetItem(context, contecnt),
//           onPressed: () => showDialogItem(context, contecnt),
//           icon: const Icon(
//             Icons.add,
//             color: AppColors.primarycolor,
//           ),
//         ),
//       ),
//     );
//   }
// }
class ShowDialogItems extends StatelessWidget {
  const ShowDialogItems(
      {super.key, required this.contecnt, required this.name});
  final Widget contecnt;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 2,
            color: AppColors.primarycolor,
          ),
        ),
        title: Text(
          name,
          style: TextStyle(color: Colors.black.withOpacity(0.26), fontSize: 20),
        ),
        trailing: IconButton(
          onPressed: () => showDialogItem(context, contecnt),
          icon: const Icon(
            Icons.add,
            color: AppColors.primarycolor,
          ),
        ),
      ),
    );
  }
}

itemSnackBar(context, String title, Color color) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 2),
    content: Text(
      textDirection: TextDirection.rtl,
      title,
      style: AppTextStyles.lrTitles.copyWith(color: Colors.white, fontSize: 15),
    ),
    backgroundColor: color,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
