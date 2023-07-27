import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../routes/routes.dart';

enum RegistrationType {
  institute,
  academicTeacher,
  sportCoach
}

class TutorSelectionScreen extends StatefulWidget {
  const TutorSelectionScreen({super.key});

  @override
  _TutorSelectionScreenState createState() => _TutorSelectionScreenState();
}

class _TutorSelectionScreenState extends State<TutorSelectionScreen> {
  RegistrationType selectedTutorType = RegistrationType.institute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.register_selection_title),
        ),
        body: registerSelectionWidget());
  }

  Widget registerSelectionWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: academicTeacher(),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: sportCoach(),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: institute(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(alignment: Alignment.centerRight, child: nextButton()),
        )
      ],
    );
  }

  ///Next Button
  Widget nextButton() {
    return FilledButton(
        onPressed: () {

          //context.go(Routes.registerAccountPage);
          GoRouter.of(context).push(Routes.registerAccountPage);

        },
        child: Text(AppLocalizations.of(context)!.button_next));
  }

  ///Private Tutor button
  Widget academicTeacher() {
    return ListTile(
      selected: selectedTutorType == RegistrationType.academicTeacher,
      selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
      selectedColor: Theme.of(context).colorScheme.onPrimaryContainer,
      title:
          Text(AppLocalizations.of(context)!.register_selection_academic_teacher),
      subtitle: Text(AppLocalizations.of(context)!
          .register_selection_academic_teacher_content),
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Theme.of(context).colorScheme.primaryContainer, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        setState(() {

          selectedTutorType = RegistrationType.academicTeacher;

        });
      },
    );
  }

  ///Sport coach button
  Widget sportCoach() {
    return ListTile(
      selected: selectedTutorType == RegistrationType.sportCoach,
      selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
      selectedColor: Theme.of(context).colorScheme.onPrimaryContainer,
      title:
      Text(AppLocalizations.of(context)!.register_selection_sport_coach),
      subtitle: Text(AppLocalizations.of(context)!
          .register_selection_sport_coach_content),
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Theme.of(context).colorScheme.primaryContainer, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        setState(() {
          selectedTutorType = RegistrationType.sportCoach;
        });
      },
    );
  }

  ///Institute button
  Widget institute() {
    return ListTile(
      selected: false,
      //selectedTileColor: Theme.of(context).colorScheme.outline,
      //selectedColor: Theme.of(context).colorScheme.onPrimaryContainer,

      title: Text(AppLocalizations.of(context)!.register_selection_institute),
      subtitle: Text(
          AppLocalizations.of(context)!.register_selection_institute_content),
      trailing: Text(AppLocalizations.of(context)!.not_available),

      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Theme.of(context).colorScheme.primaryContainer, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),

      // onTap: () {
      //   setState(() {
      //     _selectedTutorType = TutorType.institute;
      //   });
      // },
    );
  }
}
