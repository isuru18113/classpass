import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_input/decoration/underline_decoration.dart';
import 'package:password_input/inputText/password_input_text_field.dart';


  Widget phoneNumberInputWidget(BuildContext context, TextEditingController controller) {
    return Center(
      child: SizedBox(

        child: PasswordInputTextField(
          passwordLength: 10,
          controller: controller,
          decoration: UnderlineDecoration(
            color: Theme.of(context).colorScheme.primary,
            gapSpace: 10,
          ),
          keyboardType: TextInputType.phone,
          autoFocus: true,
          inputFormatter: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_@.]')),
          ],
          textInputAction: TextInputAction.done,
          onSubmit: (password) {
            if (password == null || password.isEmpty || password.length > 6) {
              // setState(() {
              //   _errorMessage = "Enter Password";
              // });
            }
          },
        ),
      ),
    );
  }

