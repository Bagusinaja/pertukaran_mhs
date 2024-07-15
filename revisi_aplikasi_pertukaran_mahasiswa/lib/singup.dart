import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revisi_aplikasi_pertukaran_mahasiswa/loginpage.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _retypePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 18, 0, 119), Colors.white],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: ListView(
              children: [
                _header(),
                _buildSignUpForm(context),
                _loginInfo(context),
              ],
            ),
          ),
        ),
        bottomNavigationBar: null,
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Text(
          "Aplikasi Pertukaran Mahasiswa",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text("Create Account", style: TextStyle(color: Colors.white)),
        Text("Enter details to get started", style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildSignUpForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField("Username", Icons.person, _usernameController),
            SizedBox(height: 10),
            _buildTextField("Email", Icons.email_outlined, _emailController),
            SizedBox(height: 10),
            _buildTextField("Password", Icons.password_outlined, _passwordController, isPassword: true),
            SizedBox(height: 10),
            _buildTextField("Retype Password", Icons.password_outlined, _retypePasswordController, isPassword: true),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _signUp(context),
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon, TextEditingController controller, {bool isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        fillColor: Colors.grey.withOpacity(0.1),
        filled: true,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?", style: TextStyle(color: Colors.black)),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginPage()));
          },
          child: Text("Login", style: TextStyle(color: Colors.black)),
        )
      ],
    );
  }

  Future<void> _signUp(BuildContext context) async {
    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final retypePassword = _retypePasswordController.text;

    if (username.isEmpty || email.isEmpty || password.isEmpty || retypePassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    if (password != retypePassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('users').add({
        'username': username,
        'email': email,
        'password': password, // Note: In a real app, never store plain text passwords. Use proper encryption.
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
}
