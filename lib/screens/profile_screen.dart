import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:amalskuy/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String getUsernameFromEmail(String email) {
    final splitEmail = email.split('@');
    return splitEmail[0];
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void removeUser() async {
  try {
    await user?.delete();
    // If the user account was deleted successfully, sign out the user.
    FirebaseAuth.instance.signOut();
    // Show a success message or navigate to another screen.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Akun berhasil dihapus')),
    );
  } catch (e) {
    // If there was an error deleting the user account, show an error message.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Terjadi kesalahan: $e')),
    );
  }
}

void updatePassword() async {
    try {
      await user.updatePassword(_passwordController.text.trim());
      // If the email was updated successfully, show a success message.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password berhasil diperbarui')),
      );
    } on FirebaseAuthException catch (e) {
      // If there was an error updating the email, show an error message.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    }
  }

  
  @override
  Widget build(BuildContext context) {
    final username = getUsernameFromEmail(user.email!);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text("Profile", 
              style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w800,
              ),),
            ),
            const SizedBox(height: 30,),
            Container(
              height: 100,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue[200],
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(faker.image.image(keywords: ['person']),))
              ),
              child: Text(
                username.substring(1, 1).toUpperCase(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                username,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(child: Text(user.email!, 
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: kprimaryColor,
            ),)),
            const SizedBox(
              height: 90,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password Baru',
                border: OutlineInputBorder(
              ),
            ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: updatePassword,
              child: const Text("Update Password"),
            ),
            ElevatedButton(
              onPressed: removeUser,
              child: const Text("Hapus Akun"),
            ),
            ElevatedButton(
              onPressed: signUserOut,
              child: const Text("LogOut"),
            ),
          ],
        ),
      ),
    );
  }
}