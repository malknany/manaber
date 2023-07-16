import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class PinField extends StatelessWidget {
  const PinField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 50,
      height: 50,
      child: TextField(
        onChanged: (value){
          if(value.length==1){
            FocusScope.of(context).nextFocus();
          }
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],

      ),
    );
  }
}
