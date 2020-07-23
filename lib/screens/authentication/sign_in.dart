import 'package:Coffe/services/auth.dart';
import 'package:Coffe/shared/constants.dart';
import 'package:Coffe/shared/loading.dart';
import "package:flutter/material.dart";

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text("SignIn"),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text("Sign Up"),
          ),
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                TextFormField(
                  decoration: kTextInputDecoration.copyWith(hintText: "Email"),
                  validator: (value) => value.isEmpty ? "Enter an email" : null,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration:
                      kTextInputDecoration.copyWith(hintText: "Password"),
                  validator: (value) => value.length < 6
                      ? "Password length must be 6 or higher"
                      : null,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  color: Colors.brown[500],
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (result == null) {
                        setState(() {
                          error = "Invalid Credential";
                          loading = false;
                        });
                      }
                    }
                  },
                  child: Text("SignIn"),
                ),
                SizedBox(height: 20),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 12.0),
                ),
              ],
            ),
          )),
    );
  }
}

// RaisedButton(
//           onPressed: () async {
//             dynamic result = await _auth.signInAnon();
//             if (result == null) {
//               print("null ");
//             } else {
//               print("signedin");
//               print(result.uid);
//             }
//           },
//           child: Text("Signin annon"),
//         ),
