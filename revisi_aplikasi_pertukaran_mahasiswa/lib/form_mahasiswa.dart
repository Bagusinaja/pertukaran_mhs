import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/mahasiswa.dart';

class FormMahasiswa extends StatefulWidget {
  final Mahasiswa? mahasiswa;

  FormMahasiswa({this.mahasiswa});

  @override
  _FormMahasiswaState createState() => _FormMahasiswaState();
}

class _FormMahasiswaState extends State<FormMahasiswa> {
  final _formKey = GlobalKey<FormState>();
  late String _nama;
  late String _email;
  late String _universitas;
  late String _tanggalLahir;
  late String _jenisKelamin;
  late String _alamat;
  late String _nomorTelepon;
  late String _programStudi;
  late String _semester;
  late String _ipk;
  late String _universitasTujuan;
  late String _negaraTujuan;
  late String _periodePertukaran;
  late String _tujuanAlasan;

  @override
  void initState() {
    super.initState();
    if (widget.mahasiswa != null) {
      _nama = widget.mahasiswa!.nama;
      _email = widget.mahasiswa!.email;
      _universitas = widget.mahasiswa!.universitas;
      _tanggalLahir = widget.mahasiswa!.tanggalLahir;
      _jenisKelamin = widget.mahasiswa!.jenisKelamin;
      _alamat = widget.mahasiswa!.alamat;
      _nomorTelepon = widget.mahasiswa!.nomorTelepon;
      _programStudi = widget.mahasiswa!.programStudi;
      _semester = widget.mahasiswa!.semester;
      _ipk = widget.mahasiswa!.ipk;
      _universitasTujuan = widget.mahasiswa!.universitasTujuan;
      _negaraTujuan = widget.mahasiswa!.negaraTujuan;
      _periodePertukaran = widget.mahasiswa!.periodePertukaran;
      _tujuanAlasan = widget.mahasiswa!.tujuanAlasan;
    } else {
      _nama = '';
      _email = '';
      _universitas = '';
      _tanggalLahir = '';
      _jenisKelamin = '';
      _alamat = '';
      _nomorTelepon = '';
      _programStudi = '';
      _semester = '';
      _ipk = '';
      _universitasTujuan = '';
      _negaraTujuan = '';
      _periodePertukaran = '';
      _tujuanAlasan = '';
    }
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final CollectionReference mahasiswaCollection = FirebaseFirestore.instance.collection('mahasiswa');
      final mahasiswaData = Mahasiswa(
        nama: _nama,
        email: _email,
        universitas: _universitas,
        tanggalLahir: _tanggalLahir,
        jenisKelamin: _jenisKelamin,
        alamat: _alamat,
        nomorTelepon: _nomorTelepon,
        programStudi: _programStudi,
        semester: _semester,
        ipk: _ipk,
        universitasTujuan: _universitasTujuan,
        negaraTujuan: _negaraTujuan,
        periodePertukaran: _periodePertukaran,
        tujuanAlasan: _tujuanAlasan,
      ).toMap();

      if (widget.mahasiswa != null) {
        await mahasiswaCollection.doc(widget.mahasiswa!.id).update(mahasiswaData);
      } else {
        await mahasiswaCollection.add(mahasiswaData);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mahasiswa != null ? 'Edit Mahasiswa' : 'Daftar Mahasiswa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _nama,
                  decoration: InputDecoration(labelText: 'Nama'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan Nama';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _nama = value!;
                  },
                ),
                TextFormField(
                  initialValue: _email,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan Email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                TextFormField(
                  initialValue: _universitas,
                  decoration: InputDecoration(labelText: 'Universitas'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan Universitas';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _universitas = value!;
                  },
                ),
                TextFormField(
                  initialValue: _tanggalLahir,
                  decoration: InputDecoration(labelText: 'Tanggal Lahir'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan Tanggal Lahir';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _tanggalLahir = value!;
                  },
                ),
                TextFormField(
                  initialValue: _jenisKelamin,
                  decoration: InputDecoration(labelText: 'Jenis Kelamin'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan Jenis Kelamin';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _jenisKelamin = value!;
                  },
                ),
                TextFormField(
                  initialValue: _alamat,
                  decoration: InputDecoration(labelText: 'Alamat'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan Alamat';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _alamat = value!;
                  },
                ),
                TextFormField(
                  initialValue: _nomorTelepon,
                  decoration: InputDecoration(labelText: 'Nomor Telepon'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan Nomor Telepon';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _nomorTelepon = value!;
                  },
                ),
                TextFormField(
                  initialValue: _programStudi,
                  decoration: InputDecoration(labelText: 'Program Studi'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan Program Studi';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _programStudi = value!;
                  },
                ),
                TextFormField(
                  initialValue: _semester,
                  decoration: InputDecoration(labelText: 'Semester'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan Semester';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _semester = value!;
                  },
                ),
                TextFormField(
                  initialValue: _ipk,
                  decoration: InputDecoration(labelText: 'IPK'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan IPK';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _ipk = value!;
                  },
                ),
                TextFormField(
                  initialValue: _universitasTujuan,
                  decoration: InputDecoration(labelText: 'Universitas Tujuan'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan Universitas Tujuan';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _universitasTujuan = value!;
                  },
                ),
                TextFormField(
                  initialValue: _negaraTujuan,
                  decoration: InputDecoration(labelText: 'Negara Tujuan'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan Negara Tujuan';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _negaraTujuan = value!;
                  },
                ),
                TextFormField(
                  initialValue: _periodePertukaran,
                  decoration: InputDecoration(labelText: 'Periode Pertukaran'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan Periode Pertukaran';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _periodePertukaran = value!;
                  },
                ),
                TextFormField(
                  initialValue: _tujuanAlasan,
                  decoration: InputDecoration(labelText: 'Tujuan dan Alasan'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan Tujuan dan Alasan';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _tujuanAlasan = value!;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text(widget.mahasiswa != null ? 'Update' : 'Daftar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
