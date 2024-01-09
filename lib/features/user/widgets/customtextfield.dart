import 'package:flutter/material.dart';
class CustomTextformfield extends StatelessWidget {
  const CustomTextformfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.inputType,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return TextFormField(
      cursorColor: Colors.blueGrey.shade300,
      validator: (value){
        if(value!.isEmpty){
          return "This field is required";
        }
      },
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey.shade700,width: 2),

            borderRadius: BorderRadius.circular(14)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey.shade300,width: 2),
            borderRadius: BorderRadius.circular(14)
        ),
        hintText: hintText,
        hintStyle: themeData.textTheme.titleSmall,
      ),
      keyboardType: TextInputType.multiline,
    );
  }
}