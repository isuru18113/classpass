import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:password_input/decoration/underline_decoration.dart';
import 'package:password_input/inputText/password_input_text_field.dart';
import '../../routes/routes.dart';
import '../../widgets/custom_alert_dialog.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdminAuthenticationPage extends StatefulWidget {
  const AdminAuthenticationPage({Key? key}) : super(key: key);

  @override
  _AdminAuthenticationPageState createState() =>
      _AdminAuthenticationPageState();
}

class _AdminAuthenticationPageState extends State<AdminAuthenticationPage> {
  final TextEditingController _phoneNumberController = TextEditingController();

  bool checkboxValuePolicy = false;
  bool checkboxValueTerm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.admin_auth_page_title),
      ),
      body: adminAuthListView(),
    );
  }

  Widget adminAuthListView() {
    return ListView(
      children: [
        ///Phone Number input container
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: phoneNumberInputWidget(),
        ),

        ///Phone number input content
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: phoneNumberInputContent()),

        ///Privacy and policy check buttons
        termsAndPrivacy(),

        ///next button
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(alignment: Alignment.centerRight, child: nextButton()),
        ),
      ],
    );
  }


  ///verify number length
  void verifyNumberLength() {
    if (_phoneNumberController.text.isNotEmpty &&
        _phoneNumberController.text.length == 10) {

      context.go(Routes.registerSelectionPage);


    } else {

      customDialg(
              title: AppLocalizations.of(context)!.incorrect_number_title,
              content: AppLocalizations.of(context)!.incorrect_number_content,
              context: context)
          .showAlertDialog();
    }
  }

  Widget nextButton() {
    return FilledButton(
        onPressed: () {
          verifyNumberLength();
        },
        child: Text(AppLocalizations.of(context)!.button_next));
  }

  Widget phoneNumberInputContent() {
    return Text(
      AppLocalizations.of(context)!.admin_auth_page_content,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  Widget phoneNumberInputWidget() {
    return Center(
      child: SizedBox(
        child: PasswordInputTextField(
          passwordLength: 10,
          controller: _phoneNumberController,
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
            if (password.isEmpty || password.length > 6) {
              // setState(() {
              //   _errorMessage = "Enter Password";
              // });
            }
          },
        ),
      ),
    );
  }

  Widget termsAndPrivacy() {
    return Column(
      children: <Widget>[
        CheckboxListTile(
          value: checkboxValuePolicy,
          onChanged: (bool? value) {
            setState(() {
              checkboxValuePolicy = value!;
            });
          },
          title: Text(AppLocalizations.of(context)!.privacy_policy_title),
          subtitle: Text(AppLocalizations.of(context)!.privacy_policy_content),
        ),
        const Divider(),
        CheckboxListTile(
          value: checkboxValueTerm,
          onChanged: (bool? value) {
            setState(() {
              checkboxValueTerm = value!;
            });
          },
          title: Text(AppLocalizations.of(context)!.term_and_condition_title),
          subtitle:
              Text(AppLocalizations.of(context)!.term_and_condition_content),
        ),
      ],
    );
  }
}
