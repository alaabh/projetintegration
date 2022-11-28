import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:social_login_buttons/social_login_buttons.dart';

import 'package:ionicons/ionicons.dart';

import 'custom_shape.dart';

class SignUpCollector extends StatefulWidget {
  SignUpCollector({Key? key}) : super(key: key);

  @override
  State<SignUpCollector> createState() => _SignUpCollectorState();
}

class _SignUpCollectorState extends State<SignUpCollector> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _validate = false;
  bool _validatep = false;
  bool _validateu = false;
  bool _validatepa = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: Customshape(),
          child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Color(0xff4ABB47), Color(0xff97D136)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ))),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                inputField("Name", Ionicons.person_outline),
                inputField("Last Name", Ionicons.person_outline),
                inputField("Username", Ionicons.person_outline),
                inputField("Email", Ionicons.mail_open_outline),
                inputField("Password", Ionicons.lock_closed_outline),
                Container(
                  height: 65.0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Color(0xff4ABB47), Color(0xff97D136)]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          width: 500,
                          height: 200,
                          alignment: Alignment.center,
                          child: const Text(
                            'Sign Up',
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                orDivider(),
                logos(),
              ],
            )),
      ),
    );
  }
}
