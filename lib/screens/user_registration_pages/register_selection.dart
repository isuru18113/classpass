import 'package:flutter/material.dart';

enum TutorType {
  institute,
  privateTutor,
}

class TutorSelectionScreen extends StatefulWidget {
  @override
  _TutorSelectionScreenState createState() => _TutorSelectionScreenState();
}

class _TutorSelectionScreenState extends State<TutorSelectionScreen> {
  TutorType _selectedTutorType = TutorType.institute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Tutor Type'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _selectedTutorType = TutorType.institute;
              });
            },
            child: buildTutorCard(

              title: 'Institute',
              isSelected: _selectedTutorType == TutorType.institute,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selectedTutorType = TutorType.privateTutor;
              });
            },
            child: buildTutorCard(

              title: 'Private Tutor',
              isSelected: _selectedTutorType == TutorType.privateTutor,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Use _selectedTutorType to perform further actions
              // For example, based on the selected type, navigate to the respective screen or show specific content.
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget buildTutorCard({

    required String title,
    required bool isSelected,
  }) {
    return Card(
      elevation: isSelected ? 4.0 : 2.0,
      color: isSelected ? Colors.blue[100] : Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),

          ),
          Positioned(
            top: 16.0,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
