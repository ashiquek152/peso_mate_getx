import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/data/widgets/textfield_border.dart';
import 'package:peso_mate_getx/app/modules/screen_add_transactions/controllers/screen_add_transactions_controller.dart';

class TextFieldCustomized extends StatelessWidget {
  TextFieldCustomized(
      {Key? key,
      required this.formFieldContoller,
      required this.hintText,
      required this.keyboardType,
      required this.icon})
      : super(key: key);

  final TextEditingController formFieldContoller;
  final String hintText;
  final TextInputType keyboardType;
  final IconData icon;

  final addTransactionsController = Get.put(ScreenAddTransactionsController());

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
            addTransactionsController.amount = int.parse(val);
          } else {
            addTransactionsController.category = val;
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
