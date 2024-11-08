import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Email registration and email login
class RegisterEmailSection extends StatefulWidget {
  const RegisterEmailSection({super.key, required this.auth});
  final FirebaseAuth auth;

  @override
  State<RegisterEmailSection> createState() => _RegisterEmailSectionState();
}

// Controls registration form
// Validates inputs
class _RegisterEmailSectionState extends State<RegisterEmailSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success = false;
  bool _initialState = true;
  String? _userEmail;

  void _register() async {
    try {
      await widget.auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      setState(() {
        _success = true;
        _userEmail = _emailController.text;
        _initialState = false;
      });
    } catch (e) {
      setState(() {
        _success = false;
        _initialState = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              // Null check
              if (value?.isEmpty??true)
              {
                return 'Please enter an email.';
              }

              if(value!.startsWith('@') == false &&
                 value.contains('@') == true &&
                 value.substring(value.indexOf('@'), value.length - 1).contains('.')
                )
              {
                return null;
              }
              
              return 'Please enter a valid email.';
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            validator: (value) {
              if(value?.isEmpty??true)
              {
                return 'Please enter a password.';
              }

              if(value!.length < 6)
              {
                return 'Password has to be at least six characters.';
              }

              return null;
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _register();
                }
              },
              child: Text('Submit'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              _initialState
                  ? 'Please Register'
              : _success
                  ? 'Successfully registered $_userEmail'
                  : 'Registration failed',
              style: TextStyle(color: _success ? Colors.green : Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}