import 'package:flutter/material.dart';
import 'package:foodproject/Widgets/roundedButton.dart';
import 'package:foodproject/constants.dart';
import 'package:iconsax/iconsax.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'LoginTab.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class RegisterTab extends StatefulWidget {
  static const String id = 'register';
  const RegisterTab({Key? key}) : super(key: key);

  @override
  _RegisterTabState createState() => _RegisterTabState();
}

class _RegisterTabState extends State<RegisterTab> {
  static const diseasesList = [
    'None',
    'Diabetes',
    'Celiac Disease (Gluten intolerance)',
    'Lactose intolerance',
    'Tyramine intolerance',
    'Histamine intolerance'
  ];

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;
  late String email;
  late String password;
  late String userNAme;
  late String disease = '';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController userNameController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCurrentUser();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void _trySubmitForm() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid == true) {
      try {
        final newUser = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        if (newUser != null) {
          _firestore.collection("Users").add({
            "email": email,
            "username": userNAme,
            "password": password,
            "disease": disease,
          }).then((value) {
            print(value);
          });
          Navigator.pushNamed(context, LoginTab.id);
        }
      } catch (e) {
        print(e);
      }
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
                  image: AssetImage('images/foodylogo.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: TextFormField(
                  controller: userNameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a name!';
                    }

                    // Return null if the entered email is valid
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    hintStyle: khintStyle,
                    prefixIcon: const Icon(Iconsax.user, color: kGrey),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    border: kOutlineInputBorder,
                    enabledBorder: kEnabledBorder,
                    focusedBorder: kFocusedBorder,
                    disabledBorder: kDisabledBorder,
                  ),
                  onChanged: (value) {
                    userNAme = userNameController.text;
                  },
                ),
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
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  border: kOutlineInputBorder,
                  enabledBorder: kEnabledBorder,
                  focusedBorder: kFocusedBorder,
                  disabledBorder: kDisabledBorder,
                ),
                onChanged: (value) {
                  email = emailController.text;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                child: TypeAheadFormField(
                  suggestionsCallback: (pattern) => diseasesList.where(
                    (item) =>
                        item.toLowerCase().contains(pattern.toLowerCase()),
                  ),
                  itemBuilder: (_, String item) => ListTile(title: Text(item)),
                  onSuggestionSelected: (String val) {
                    this.disease = val;
                    print(val);
                  },
                  getImmediateSuggestions: true,
                  hideSuggestionsOnKeyboardHide: false,
                  hideOnEmpty: false,
                  noItemsFoundBuilder: (context) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'There is no disease with that name. Please try again!',
                      style: khintStyle,
                    ),
                  ),
                  textFieldConfiguration: TextFieldConfiguration(
                    maxLines: 1,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        prefixIcon: Icon(
                          Icons.monitor_heart_outlined,
                          color: kGrey,
                        ),
                        label: Center(
                          child: Text(
                            disease == '' ? 'Disease' : disease,
                            style: khintStyle,
                          ),
                        ),
                        border: kOutlineInputBorder,
                        enabledBorder: kEnabledBorder,
                        focusedBorder: kFocusedBorder,
                        disabledBorder: kDisabledBorder),
                  ),
                ),
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
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  border: kOutlineInputBorder,
                  enabledBorder: kEnabledBorder,
                  focusedBorder: kFocusedBorder,
                  disabledBorder: kDisabledBorder,
                ),
                onChanged: (value) {
                  password = passwordController.text;
                },
              ),
              const SizedBox(
                height: 40.0,
              ),
              RoundedButton('Register', _trySubmitForm),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginTab.id);
                  },
                  child: const Text(
                    "Already have an Account? Sign In",
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
