import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class WidgetComponents
{
  Widget CustomFormField({controller, validator, hintText, padding = 0, keyboardType = TextInputType.text, obscureText = false, suffixIcon = false})
  {
    return Padding(
      padding: padding,

      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,

        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.grey.shade100,
          filled: true,
          suffixIcon: suffixIcon == false ? SizedBox.shrink() : suffixIcon,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.grey.shade200)
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.grey)
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.red)
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.red.shade900)
          ),
        ),
      )
    );
  }

  Widget Loading()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Carregando")
      ],
    );
  }
}