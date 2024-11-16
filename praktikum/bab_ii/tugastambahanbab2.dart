// Enum untuk status proyek
enum StatusProyek { Perencanaan, Pengembangan, Evaluasi }

// Kelas untuk mendefinisikan Karyawan
abstract class Karyawan {
  final String nama;
  final int umur;
  final String posisi;
  double produktivitas;

  Karyawan({
    required this.nama,
    required this.umur,
    required this.posisi,
    this.produktivitas = 50.0,
  });

  // Metode untuk bekerja, perlu diimplementasikan oleh subclass
  void bekerja();

  // Setter untuk mengubah produktivitas
  void setProduktivitas(double nilai) {
    if (nilai >= 0 && nilai <= 100) {
      produktivitas = nilai;
    } else {
      print('Nilai produktivitas harus antara 0 dan 100.');
    }
  }

  // Getter untuk mengambil produktivitas
  double getProduktivitas() {
    return produktivitas;
  }
}

// Subclass Karyawan Tetap
class KaryawanTetap extends Karyawan with MixinProduktivitas { // Menggunakan mixin di sini
  KaryawanTetap({
    required String nama,
    required int umur,
    required String posisi,
  }) : super(nama: nama, umur: umur, posisi: posisi);

  @override
  void bekerja() {
    print('$nama yang berposisi sebagai $posisi bekerja penuh waktu.');
  }
}

// Subclass Karyawan Kontrak
class KaryawanKontrak extends Karyawan with MixinProduktivitas { // Menggunakan mixin di sini
  KaryawanKontrak({
    required String nama,
    required int umur,
    required String posisi,
  }) : super(nama: nama, umur: umur, posisi: posisi);

  @override
  void bekerja() {
    print('$nama yang berposisi sebagai $posisi bekerja pada proyek tertentu.');
  }
}

// Mixin untuk produktivitas
mixin MixinProduktivitas {
  void tingkatkanProduktivitas(Karyawan karyawan) {
    double nilai = karyawan.getProduktivitas();
    if (nilai < 100) {
      nilai += 10;
      if (nilai > 100) {
        nilai = 100; // Tidak boleh melebihi 100
      }
      karyawan.setProduktivitas(nilai);
      print('Produktivitas ${karyawan.nama} meningkat menjadi ${karyawan.getProduktivitas()}%');
    }
  }
}

// Kelas untuk mengelola proyek
class Proyek {
  String namaProyek;
  StatusProyek status;
  int jumlahKaryawan;
  DateTime tanggalMulai;

  Proyek({
    required this.namaProyek,
    required this.status,
    required this.jumlahKaryawan,
    required this.tanggalMulai,
  });

  // Metode untuk memindahkan proyek ke fase berikutnya
  void pindahKeFaseBerikutnya() {
    switch (status) {
      case StatusProyek.Perencanaan:
        if (jumlahKaryawan >= 5) {
          status = StatusProyek.Pengembangan;
          print('Proyek $namaProyek pindah ke fase Pengembangan.');
        } else {
          print('Jumlah karyawan belum memenuhi syarat untuk pindah fase.');
        }
        break;
      case StatusProyek.Pengembangan:
        if (DateTime.now().difference(tanggalMulai).inDays > 45) {
          status = StatusProyek.Evaluasi;
          print('Proyek $namaProyek pindah ke fase Evaluasi.');
        } else {
          print('Proyek belum berjalan lebih dari 45 hari.');
        }
        break;
      case StatusProyek.Evaluasi:
        print('Proyek $namaProyek sudah selesai di fase Evaluasi.');
        break;
    }
  }
}

// Kelas untuk mengelola perusahaan dan karyawan
class Perusahaan {
  List<Karyawan> karyawanAktif = [];
  List<Karyawan> karyawanNonAktif = [];
  final int maxKaryawanAktif = 20;

  // Menambah karyawan aktif
  void tambahKaryawan(Karyawan karyawan) {
    if (karyawanAktif.length < maxKaryawanAktif) {
      karyawanAktif.add(karyawan);
      print('Karyawan ${karyawan.nama} berhasil ditambahkan.');
    } else {
      print('Batas maksimum karyawan aktif tercapai.');
    }
  }

  // Menghapus karyawan dan memindahkannya ke non-aktif
  void resignKaryawan(Karyawan karyawan) {
    if (karyawanAktif.contains(karyawan)) {
      karyawanAktif.remove(karyawan);
      karyawanNonAktif.add(karyawan);
      print('Karyawan ${karyawan.nama} telah resign.');
    }
  }

  // Menampilkan daftar karyawan aktif
  void tampilkanKaryawanAktif() {
    print('Daftar Karyawan Aktif:');
    for (var karyawan in karyawanAktif) {
      print('${karyawan.nama} - ${karyawan.posisi}');
    }
  }

  // Menampilkan daftar karyawan non-aktif
  void tampilkanKaryawanNonAktif() {
    print('Daftar Karyawan Non-Aktif:');
    for (var karyawan in karyawanNonAktif) {
      print('${karyawan.nama} - ${karyawan.posisi}');
    }
  }
}

// Fungsi utama untuk menjalankan aplikasi
void main() {
  // Membuat objek karyawan
  Karyawan karyawan1 = KaryawanTetap(
    nama: 'Alice',
    umur: 30,
    posisi: 'Developer',
  );
  Karyawan karyawan2 = KaryawanKontrak(
    nama: 'Bob',
    umur: 35,
    posisi: 'Manager',
  );

  // Mengelola perusahaan dan menambahkan karyawan
  Perusahaan perusahaan = Perusahaan();
  perusahaan.tambahKaryawan(karyawan1);
  perusahaan.tambahKaryawan(karyawan2);
  perusahaan.tampilkanKaryawanAktif();

  // Memindahkan proyek ke fase berikutnya
  Proyek proyek = Proyek(
    namaProyek: 'Proyek A',
    status: StatusProyek.Perencanaan,
    jumlahKaryawan: 5,
    tanggalMulai: DateTime.now().subtract(Duration(days: 50)),
  );
  proyek.pindahKeFaseBerikutnya();

  // Meningkatkan produktivitas karyawan menggunakan mixin
  // Sekarang kita memanggil tingkatkanProduktivitas melalui objek yang sesuai
  // Objek karyawan1 adalah tipe KaryawanTetap, jadi kita dapat memanggil tingkatkanProduktivitas
  if (karyawan1 is KaryawanTetap) {
    karyawan1.tingkatkanProduktivitas(karyawan1);
  }

  // Begitu juga dengan karyawan2
  if (karyawan2 is KaryawanKontrak) {
    karyawan2.tingkatkanProduktivitas(karyawan2);
  }

  // Menghapus karyawan dan memindahkannya ke non-aktif
  perusahaan.resignKaryawan(karyawan1);
  perusahaan.tampilkanKaryawanNonAktif();
}
