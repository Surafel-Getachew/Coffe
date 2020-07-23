import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ["0", "1", "2", "3", "4", "5"];

  // form values
  String _currentName;
  String _currentSugar;
  String _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form (
      key:_formKey,
      child: Column(
        children: <Widget>[
          Text("Update your brew settings.",style: TextStyle(fontSize: 18.0),),
        ],
      ),
    );
  }
}
