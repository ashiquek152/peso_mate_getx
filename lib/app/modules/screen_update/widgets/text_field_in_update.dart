import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/data/widgets/textfield_border.dart';
import 'package:peso_mate_getx/app/modules/screen_update/controllers/screen_update_controller.dart';

class TextFieldInUpdate extends StatelessWidget {
   TextFieldInUpdate({
    Key? key,
    // required this.updateController,
    required this.hintText,
    required this.keyboardType,
    required this.icon,
    required this.formFieldContoller,
  }) : super(key: key);

  final String hintText;
  final TextInputType keyboardType;
  final IconData icon;
  final TextEditingController formFieldContoller;

  final ScreenUpdateController updateController=Get.put(ScreenUpdateController());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: formFieldContoller,
        validator: (value) {
          return (value == null || value.isEmpty)
              ? 'This field is required '
              : null;
        },
        maxLength: 15,
        decoration: textFiledDecorations(hintText, icon),
        style: const TextStyle(color: scaffoldbgnew),
        onChanged: (val) {
          if (hintText == "Amount") {
            updateController.onChangedAmount(val);
          } else {
            updateController.onChangedCat(val);
          }
        },
        inputFormatters: [
          hintText == "Amount"
              ? FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              : FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
        ],
        keyboardType: keyboardType
        );
  }
}
