import 'package:flutter/material.dart';
import 'package:revisi_aplikasi_pertukaran_mahasiswa/progam_pertukaran.dart';
import 'package:revisi_aplikasi_pertukaran_mahasiswa/syarat_dan_peluang.dart';
import 'package:revisi_aplikasi_pertukaran_mahasiswa/form_mahasiswa.dart'; // Import form_mahasiswa.dart

class TampilanHalaman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 18, 0, 119), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 1.0],
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Datang di Aplikasi Pertukaran Mahasiswa',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, 
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            _buildButton(
              'Program Pertukaran',
              Icons.school, 
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgramPertukaranPage()),
                );
              },
            ),
            SizedBox(height: 10), 
            _buildButton(
              'Syarat & Peluang',
              Icons.rule, 
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SyaratPeluangPage()),
                );
              },
            ),
            SizedBox(height: 10),
            _buildButton(
              'Daftar Sekarang',
              Icons.person_add, 
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormMahasiswa()), // Navigasi ke FormMahasiswa
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, IconData icon, VoidCallback onPressed) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.blue, 
          width: 2, 
        ),
        color: Colors.white, 
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon), 
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.blue, 
              fontSize: 16,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), 
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationButton(IconData icon, String text, VoidCallback onPressed) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.blue, 
          width: 2, 
        ),
        color: Colors.white, 
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon), 
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.blue, 
              fontSize: 16,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), 
          ),
        ),
      ),
    );
  }

  void _showUpdateNotificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pengaturan Notifikasi"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Menerima update dan notifikasi terkait status aplikasi?"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); 
                },
                child: Text("Ya, Aktifkan"),
              ),
            ],
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TampilanHalaman(),
  ));
}
