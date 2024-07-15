import 'package:flutter/material.dart';

class ProgramPertukaranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Program Pertukaran'),
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
                Text(
                  'Program Pertukaran Mahasiswa',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Deskripsi Program:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Program pertukaran mahasiswa merupakan program yang memungkinkan mahasiswa untuk belajar di luar negeri selama satu semester atau lebih. '
                  'Program ini bertujuan untuk meningkatkan pengalaman akademik dan budaya mahasiswa serta memperluas wawasan mereka.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Manfaat Program:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBulletPoint(
                        'Memperluas wawasan dan pengetahuan mahasiswa'),
                    _buildBulletPoint('Meningkatkan keterampilan bahasa asing'),
                    _buildBulletPoint('Mengembangkan jejaring internasional'),
                    _buildBulletPoint('Memperkaya pengalaman budaya'),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Proses Pendaftaran:',
                    style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '1. Pilih universitas tujuan dan program studi yang sesuai.\n'
                  '2. Isi formulir pendaftaran program pertukaran.\n'
                  '3. Serahkan dokumen yang diperlukan seperti transkrip akademik dan surat rekomendasi.\n'
                  '4. Tunggu konfirmasi dari universitas tujuan.\n'
                  '5. Persiapkan dokumen perjalanan dan visa.\n'
                  '6. Ikuti orientasi sebelum berangkat ke luar negeri.\n'
                  '7. Nikmati pengalaman belajar dan budaya di negara tujuan!',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 10,
            child: Icon(
              Icons.arrow_forward,
              size: 16,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
