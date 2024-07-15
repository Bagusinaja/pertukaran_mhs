import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revisi_aplikasi_pertukaran_mahasiswa/tampilan_halaman.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController, passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email dan password harus diisi')),
      );
      return;
    }

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        print("Email ditemukan: ${querySnapshot.docs.first.data()}");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TampilanHalaman(),
          ),
        );
      } else {
        print("Email tidak ditemukan di Firestore.");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email tidak ditemukan')),
        );
      }
    } catch (e) {
      print("Error saat mengakses Firestore: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 18, 0, 119),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Expanded(child: _buildInputFields())
          ],
        ),
      ),
    );
  }

  Widget _buildInputFields() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Column(
              children: [
                _buildTextField(
                    "Enter email here", Icons.email, emailController),
                const SizedBox(height: 6),
                _buildTextField("Password", Icons.lock, passwordController,
                    isPass: true),
              ],
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot Password",
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 24),
            _buildButton(
              "Login",
              const Color.fromARGB(255, 83, 136, 235),
              _login,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String hint, IconData icon, TextEditingController controller,
      {bool isPass = false}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        border: Border.all(color: Colors.blue),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 94, 94, 94)),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.black),
              obscureText: isPass,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String buttonText, Color color, Function()? onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 2,
        backgroundColor: color,
        minimumSize: const Size.fromHeight(40),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
