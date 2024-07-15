import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revisi_aplikasi_pertukaran_mahasiswa/models/mahasiswa.dart';

class MahasiswaService {
  final CollectionReference mahasiswaCollection =
      FirebaseFirestore.instance.collection('mahasiswa');

  Future<void> tambahMahasiswa(Mahasiswa mahasiswa) {
    return mahasiswaCollection.add(mahasiswa.toMap());
  }

  Future<void> perbaruiMahasiswa(Mahasiswa mahasiswa) {
    return mahasiswaCollection.doc(mahasiswa.id).update(mahasiswa.toMap());
  }

  Future<void> hapusMahasiswa(String id) {
    return mahasiswaCollection.doc(id).delete();
  }

  Stream<List<Mahasiswa>> getMahasiswa() {
    return mahasiswaCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Mahasiswa.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }
}
