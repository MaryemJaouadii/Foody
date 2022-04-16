import 'package:flutter/material.dart';
import 'package:foodproject/constants.dart';
import 'package:foodproject/main.dart';
import 'package:foodproject/screens/RegisterTab.dart';
import 'package:iconsax/iconsax.dart';
import 'package:foodproject/screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginTab extends StatefulWidget {
  static const String id = 'login';
  const LoginTab({Key? key}) : super(key: key);

  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {

  final _auth = FirebaseAuth.instance;

  var _formKey;
  late String email;
  late String password;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  //final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  void _trySubmitForm() async {
   // final isValid = _formKey.currentState!.validate();
  //  if (isValid == true) {
      try{
        final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
        if(user != null)
          Navigator.pushNamed(context, HomeScreen.id);
      }
      catch(e)
      {print(e);}
  //  }
  }
@override
  void dispose() {
    // TODO: implement dispose
  emailController.dispose();
  passwordController.dispose();
    super.dispose();
  }
  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: ListView(
              children: [
                const Center(
                  child: Image(
                    height: 200,
                    width: 200,
                    image: AssetImage('images/grey_version_logo.png'),
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
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: khintStyle,
                      prefixIcon: Icon(Iconsax.user, color: kGrey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                    onChanged: (value){
                      email=emailController.text;
                    },
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: passwordController,
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
                    prefixIcon: Icon(Iconsax.key, color: kGrey),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  ),
                  onChanged: (value){
                    password=passwordController.text;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password? ',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 14.0,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFEA676A),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: OutlinedButton(
                        onPressed: _trySubmitForm,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: const Text('Login',
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
                    child: Text(
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
      ),
    );
  }*/
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

              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
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
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  hintStyle: khintStyle,
                  prefixIcon: const Icon(Iconsax.user, color: kGrey),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                ),
                onChanged: (value){
                  email=emailController.text;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: passwordController,
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
                onChanged: (value){
                  password=passwordController.text;
                },
              ),
              const SizedBox(
                height: 40.0,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFEA676A),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: OutlinedButton(
                      onPressed: _trySubmitForm,
                      child: const Text('Login',
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25.0,
                          )))),
              TextButton(
                  onPressed:(){Navigator.pushNamed(context, RegisterTab.id);},
                  child: const Text(
                    "You don't  have an Account? Sign Up",
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