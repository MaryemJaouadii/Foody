import 'package:flutter/material.dart';
import 'package:foodproject/constants.dart';
import 'package:foodproject/screens/MoreInfo.dart';
import 'package:foodproject/screens/RegisterTab.dart';
import 'package:iconsax/iconsax.dart';

class LoginTab extends StatefulWidget {
  static const String id = 'login';
  const LoginTab({Key? key}) : super(key: key);

  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  var _formKey;

  String email = '';
  String password = '';

  //final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  void _trySubmitForm() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      Navigator.pushNamed(context, MoreInfo.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: [
              const Center(
                child: Image(
                  height: 200,
                  width: 200,
                  image: AssetImage('images/logo3.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter an email!';
                    }
                    // Check if the entered email has the right format
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email!';
                    }
                    // Return null if the entered email is valid
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                    hintStyle: khintStyle,
                    prefixIcon: const Icon(Iconsax.user, color: kGrey),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.trim().length < 8) {
                    return "Password can't be less than 8 characters";
                  }

                  return null;
                },
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hoverColor: Colors.black,
                  hintText: 'Password',
                  hintStyle: khintStyle,
                  prefixIcon: const Icon(Iconsax.key, color: kGrey),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password? ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 14.0,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFEA676A),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MoreInfo.id);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text('Login',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20.0,
                            )),
                      ))),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterTab.id);
                  },
                  child: const Text(
                    "Don't have an Account? Sign Up",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
