import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:amalskuy/components/my_button.dart';
import 'package:amalskuy/components/my_textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:amalskuy/components/square_tile.dart';
import 'package:amalskuy/services/auth_service.dart';
import 'package:amalskuy/constants.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      //pop the loading circle
      Navigator.pop(context);
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
                const SizedBox(height: 100),
                //login
                const Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Row(
                    children: [
                      Text("Masuk",
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
                        'Masukkan data diri anda, berupa email \ndan kata sandi untuk masuk ke AmalSkuy!',
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
                  hintText: 'Username atau email',
                  obscureText: false,
                ),

                const SizedBox(height: 15),
                //password
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 25),

                //sign in button
                MyButton(
                  onTap: signUserIn,
                  text: 'Masuk',
                ),
                const SizedBox(height: 20),

                //forgot passowrd

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Lupa Password Kamu? ',
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        'Reset Password via Email.',
                        style: TextStyle(
                          color:  kprimaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

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
                        padding: const EdgeInsets.only(left: 8, right: 8,),
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


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun? ',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Daftar Skuy',
                        style: TextStyle(
                            color:  kprimaryColor,
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
