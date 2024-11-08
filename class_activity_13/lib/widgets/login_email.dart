import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Build class for user login and email
// Skeleton from above
class EmailPasswordForm extends StatefulWidget {
  const EmailPasswordForm({super.key, required this.auth});
  final FirebaseAuth auth;

  @override
  State<EmailPasswordForm> createState() => _EmailPasswordFormState();
}

class _EmailPasswordFormState extends State<EmailPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success = false;
  bool _initialState = true;
  String _userEmail ='';

  void _signInWithEmailAndPassword() async {
    try {
      await widget.auth.signInWithEmailAndPassword(
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
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Text('Test sign in with email and password'),
          ),
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
                  _signInWithEmailAndPassword();
                }
              },
              child: Text('Submit'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              _initialState
                  ? 'Please sign in'
                  : _success
                  ? 'Successfully signed in $_userEmail'
                  : 'Sign in failed',
              style: TextStyle(color: _success ? Colors.green : Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
