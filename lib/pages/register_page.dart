import 'package:amalskuy/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:amalskuy/components/my_textfield.dart';
import 'package:amalskuy/components/my_button.dart';
import 'package:amalskuy/components/square_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
  // show loading circle
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  try {
    // check if both password and confirm pasword is same
    if (passwordController.text == confirmPasswordController.text) {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );


      //pop the loading circle
      Navigator.pop(context);

    } else {
      //show error password dont match
      genericErrorMessage("Password tidak sesuai");
    }
  } on FirebaseAuthException catch (e) {
    //pop the loading circle
    Navigator.pop(context);

    genericErrorMessage(e.code);
  }
}

  void genericErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                //login
                const Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Row(
                    children: [
                      Text("Daftar",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "DMSans",
                        fontWeight: FontWeight.w800,
                        fontSize: 40,
                      ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: [
                      Text(
                        'Isi formulir pendaftaran dibawah ini\ndengan informasi terkait data diri anda lalu\nmari memulai perjalanan bersama kita.',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontFamily: "DMSans",
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                //username
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 15),
                //password
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 15),

                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Konfirmasi Password',
                  obscureText: true,
                ),
                const SizedBox(height: 25),

                //sign in button
                MyButton(
                  onTap: signUserUp,
                  text: 'Daftar',
                ),
                const SizedBox(height: 20),

                // continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          'atau',
                          style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                //google

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google buttom
                    SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: "assets/images/googlelogo.png",
                      height: 30,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),

                // not a memeber ? register now

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah memiliki akun? ',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Masuk',
                        style: TextStyle(
                            color: kprimaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
