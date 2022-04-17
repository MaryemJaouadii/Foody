import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodproject/Widgets/roundedButton.dart';
import 'package:foodproject/constants.dart';
import 'package:foodproject/screens/HomeScreen.dart';
import 'package:foodproject/screens/RegisterTab.dart';
import 'package:iconsax/iconsax.dart';

class LoginTab extends StatefulWidget {
  static const String id = 'login';
  const LoginTab({Key? key}) : super(key: key);

  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  bool showSpinner = false;
  void _trySubmitForm() async {
    /*
    final isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      Navigator.pushNamed(context, HomeScreen.id);
    }
    */

    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        Navigator.pushNamed(context, HomeScreen.id);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.grey.withOpacity(0.7),
        content: const Text('Please verify your credentials !',
            style: TextStyle(fontWeight: FontWeight.w600)),
      ));
      print(e);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                  image: AssetImage('images/foodylogo.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: TextFormField(
                  controller: emailController,
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
                  onChanged: (value) {
                    email = emailController.text;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: 'Email Address',
                    hintStyle: TextStyle(
                      color: kGrey,
                    ),
                    prefixIcon: Icon(Iconsax.user, color: kGrey),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: kOutlineInputBorder,
                    enabledBorder: kEnabledBorder,
                    focusedBorder: kFocusedBorder,
                    disabledBorder: kDisabledBorder,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onChanged: (value) {
                  password = passwordController.text;
                },
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hoverColor: Colors.black,
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: kGrey,
                  ),
                  prefixIcon: Icon(Iconsax.key, color: kGrey),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: kOutlineInputBorder,
                  enabledBorder: kEnabledBorder,
                  focusedBorder: kFocusedBorder,
                  disabledBorder: kDisabledBorder,
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
                      child: Text('Forgot Password? ',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 15,
                              fontFamily: 'Poppins-Regular',
                              decoration: TextDecoration.none))),
                ],
              ),
              const SizedBox(
                height: 14.0,
              ),
              RoundedButton(
                'Login',
                _trySubmitForm,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterTab.id);
                  },
                  child: const Text(
                    "Don't have an Account? Sign Up",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF36363a),
                        fontFamily: 'Poppins'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
