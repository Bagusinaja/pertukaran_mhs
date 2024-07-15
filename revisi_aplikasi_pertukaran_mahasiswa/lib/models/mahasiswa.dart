class Mahasiswa {
  final String? id;
  final String nama;
  final String email;
  final String universitas;
  final String tanggalLahir;
  final String jenisKelamin;
  final String alamat;
  final String nomorTelepon;
  final String programStudi;
  final String semester;
  final String ipk;
  final String universitasTujuan;
  final String negaraTujuan;
  final String periodePertukaran;
  final String tujuanAlasan;

  Mahasiswa({
    this.id,
    required this.nama,
    required this.email,
    required this.universitas,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.alamat,
    required this.nomorTelepon,
    required this.programStudi,
    required this.semester,
    required this.ipk,
    required this.universitasTujuan,
    required this.negaraTujuan,
    required this.periodePertukaran,
    required this.tujuanAlasan,
  });

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'email': email,
      'universitas': universitas,
      'tanggalLahir': tanggalLahir,
      'jenisKelamin': jenisKelamin,
      'alamat': alamat,
      'nomorTelepon': nomorTelepon,
      'programStudi': programStudi,
      'semester': semester,
      'ipk': ipk,
      'universitasTujuan': universitasTujuan,
      'negaraTujuan': negaraTujuan,
      'periodePertukaran': periodePertukaran,
      'tujuanAlasan': tujuanAlasan,
    };
  }

  static Mahasiswa fromMap(Map<String, dynamic> map, String id) {
    return Mahasiswa(
      id: id,
      nama: map['nama'],
      email: map['email'],
      universitas: map['universitas'],
      tanggalLahir: map['tanggalLahir'],
      jenisKelamin: map['jenisKelamin'],
      alamat: map['alamat'],
      nomorTelepon: map['nomorTelepon'],
      programStudi: map['programStudi'],
      semester: map['semester'],
      ipk: map['ipk'],
      universitasTujuan: map['universitasTujuan'],
      negaraTujuan: map['negaraTujuan'],
      periodePertukaran: map['periodePertukaran'],
      tujuanAlasan: map['tujuanAlasan'],
    );
  }
}
