import 'package:flutter/material.dart';

class TipsPanduanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips & Panduan'),
      ),
      body: Center(
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tips untuk Persiapan Pertukaran Mahasiswa:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '1. Persiapkan dokumen perjalanan dan visa dengan teliti.\n'
                  '2. Pelajari budaya dan kebiasaan di negara tujuan.\n'
                  '3. Tingkatkan kemampuan bahasa asing Anda sebelum berangkat.\n'
                  '4. Siapkan diri untuk menghadapi tantangan dan perubahan lingkungan.\n'
                  '5. Jalin komunikasi dengan mahasiswa atau staf asal negara tujuan.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Panduan untuk Persiapan Pertukaran Mahasiswa:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '1. Periksa persyaratan dan prosedur pendaftaran program pertukaran.\n'
                  '2. Konsultasikan dengan koordinator pertukaran atau penasihat akademik.\n'
                  '3. Rencanakan anggaran keuangan selama masa pertukaran di luar negeri.\n'
                  '4. Siapkan diri untuk mengikuti orientasi dan acara pengenalan di universitas tujuan.\n'
                  '5. Tetap terbuka terhadap pengalaman baru dan manfaatkan kesempatan belajar sebaik mungkin.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
