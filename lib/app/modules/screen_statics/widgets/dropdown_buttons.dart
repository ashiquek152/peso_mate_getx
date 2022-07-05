import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/data/widgets/text_widget.dart';
import 'package:peso_mate_getx/app/modules/screen_statics/controllers/screen_statics_controller.dart';

class DropDownListandButtons extends StatelessWidget {
  DropDownListandButtons({
    Key? key,
  }) : super(key: key);

  final ScreenStaticsController staticsController =
      Get.put(ScreenStaticsController());

  @override
  Widget build(BuildContext context) {
    double mqW = MediaQuery.of(context).size.width;
    double mqH = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(()=>Container(
          width: mqW * 0.26,
          height: mqH * 0.05,
          decoration: BoxDecoration(
              color: amber, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: DropdownButton<String>(
                iconEnabledColor: Colors.white,
                dropdownColor: amber,
                style: const TextStyle(
                    color: Colors.white, fontFamily: fontComforataa),
                underline: const Text(''),
                borderRadius: BorderRadius.circular(10),
                items: staticsController.items
                    .map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                value: staticsController.statDropDownValue.value,
                onChanged: (String? newValue) {
                  staticsController.statDropDownValue.value = newValue!;
                }),
          ),
        ),),
        const SizedBox(
          width: 10,
        ),
        Obx(()=>
           Row(
            children: [
              InkWell(
                onTap: () => staticsController.statIndex.value = 1,
                child: Container(
                  width: mqW * 0.26,
                  height: mqH * 0.05,
                  decoration: BoxDecoration(
                      color: staticsController.statIndex.value == 1
                          ? scaffoldbgnew
                          : amber,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    'This Month',
                    style: TextStyle(
                        color: staticsController.statIndex.value == 1
                            ? Colors.white
                            : const Color.fromARGB(255, 99, 98, 98)),
                  )),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () => staticsController.statIndex.value = 2,
                child: Container(
                  width: mqW * 0.26,
                  height: mqH * 0.05,
                  decoration: BoxDecoration(
                      color: staticsController.statIndex.value == 2
                          ? scaffoldbgnew
                          : amber,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    'This Year',
                    style: TextStyle(
                        color: staticsController.statIndex.value == 2
                            ? Colors.white
                            : const Color.fromARGB(255, 99, 98, 98)),
                  )),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
