import 'package:flutter/material.dart';
import 'package:revisi_aplikasi_pertukaran_mahasiswa/tips_dan_panduan.dart';
import 'package:revisi_aplikasi_pertukaran_mahasiswa/form_mahasiswa.dart';
class SyaratPeluangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syarat & Peluang'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8, 
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 183, 255),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.blue, 
                width: 2, 
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), 
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Syarat Program Pertukaran:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '1. Mahasiswa aktif di perguruan tinggi yang telah menyelesaikan minimal dua semester.\n'
                      '2. Indeks Prestasi Kumulatif (IPK) minimal 3.0.\n'
                      '3. Surat rekomendasi dari fakultas atau jurusan.\n'
                      '4. Bahasa Inggris minimal skor TOEFL 550 atau IELTS 6.0.\n'
                      '5. Persetujuan dari orang tua atau wali.\n'
                      '6. Dokumen perjalanan dan visa yang lengkap.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Peluang Program Pertukaran:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '1. Kesempatan untuk belajar di lingkungan akademik yang berbeda.\n'
                      '2. Pengalaman budaya yang berharga.\n'
                      '3. Memperluas jaringan internasional.\n'
                      '4. Meningkatkan keterampilan berbahasa asing.\n'
                      '5. Akses ke sumber daya dan fasilitas universitas luar negeri.\n'
                      '6. Peluang untuk mendapatkan pemahaman yang lebih dalam tentang mata kuliah tertentu.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TipsPanduanPage()),
          );
        },
        child: Icon(Icons.lightbulb_outline),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextButton( 
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormMahasiswa()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Daftar Sekarang',
                style: TextStyle(
                  color: const Color.fromARGB(255, 33, 150, 243),
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
