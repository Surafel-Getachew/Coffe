import 'package:Coffe/models/brew.dart';
import 'package:Coffe/screens/home/components/settings_form.dart';
import 'package:Coffe/services/auth.dart';
import 'package:Coffe/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Coffe"),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(
                Icons.person,
              ),
              label: Text("signout"),
            ),
            FlatButton.icon(
                onPressed: () {
                  return _showSettingsPanel();
                },
                icon: Icon(Icons.settings),
                label: Text("settings"))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
