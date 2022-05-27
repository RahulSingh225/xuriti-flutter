// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutt_app/screens/forgotpassword.dart';
import 'package:flutt_app/util/api_service.dart';
import 'package:flutter/material.dart';

// Define a custom Form widget.
class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class SignUpFormState extends State<SignUpForm> {
  String email = "";
  String password = "";
  bool isPasswordVisible = true;
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<SignUpFormState>.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            width: 250,
            child: TextFormField(
              onSaved: ((newValue) => email = newValue.toString()),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter mobile no.';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Mobile No.",
                hintStyle: TextStyle(color: Colors.black87),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            ),
          ),

          Container(
            width: 250,
            height: 100,
            // ignore: sort_child_properties_last
            child: ElevatedButton(
              onPressed: () async {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Loading...')),
                  );
                  var data = {
                    "email": email.toString(),
                  };
                  var response = await ApiService().login(data);
                  print(response.data);
                  if (response.data['status'] == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(response.data['message'])));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Some error")));
                }
              },
              child: const Text(
                'SEND OTP',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
            padding: EdgeInsets.only(top: 20, bottom: 30),
          ),

          TextButton(
              onPressed: (() => Navigator.pop(context)),
              child: Text("Already a registered member? Login Now"))

          // Add TextFormFields and ElevatedButton here.
        ],
      ),
    );
  }
}
