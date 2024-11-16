// import 'dart:async';

// Enum Kategori Produk untuk klasifikasi
enum Kategori { DataManagement, NetworkAutomation }

// Kelas ProdukDigital untuk produk digital
class ProdukDigital {
  final String namaProduk;
  double harga;
  final Kategori kategori;
  int jumlahTerjual;

  ProdukDigital({
    required this.namaProduk,
    required this.harga,
    required this.kategori,
    this.jumlahTerjual = 0,
  }) {
    if (kategori == Kategori.NetworkAutomation && harga < 200000) {
      throw Exception("Harga produk NetworkAutomation harus minimal 200.000.");
    } else if (kategori == Kategori.DataManagement && harga >= 200000) {
      throw Exception("Harga produk DataManagement harus di bawah 200.000.");
    }
  }

  // Metode untuk menerapkan diskon pada produk NetworkAutomation
  void terapkanDiskon() {
    if (kategori == Kategori.NetworkAutomation && jumlahTerjual > 50) {
      final diskon = harga * 0.15;
      harga = (harga - diskon).clamp(200000, double.infinity);
      print("Diskon diterapkan, harga baru: $harga");
    }
  }
}

// Enum Role untuk peran karyawan
enum Role { Developer, NetworkEngineer, Manager }

// Kelas abstrak Karyawan
abstract class Karyawan {
  final String nama;
  final int umur;
  final Role peran;

  Karyawan({
    required this.nama,
    required this.umur,
    required this.peran,
  });

  void bekerja();
}

// Subkelas KaryawanTetap
class KaryawanTetap extends Karyawan {
  KaryawanTetap({required String nama, required int umur, required Role peran})
      : super(nama: nama, umur: umur, peran: peran);

  @override
  void bekerja() {
    print("Karyawan Tetap $nama bekerja selama hari kerja reguler.");
  }
}

// Subkelas KaryawanKontrak
class KaryawanKontrak extends Karyawan {
  KaryawanKontrak({required String nama, required int umur, required Role peran})
      : super(nama: nama, umur: umur, peran: peran);

  @override
  void bekerja() {
    print("Karyawan Kontrak $nama bekerja pada proyek-proyek tertentu.");
  }
}

// Mixin Kinerja untuk produktivitas
mixin Kinerja {
  int produktivitas = 0;
  DateTime? tanggalPembaruan;

  void perbaruiProduktivitas(int nilai) {
    if (tanggalPembaruan == null || DateTime.now().difference(tanggalPembaruan!).inDays >= 30) {
      produktivitas = (produktivitas + nilai).clamp(0, 100);
      tanggalPembaruan = DateTime.now();
      print("Produktivitas diperbarui menjadi $produktivitas");
    } else {
      print("Produktivitas hanya bisa diperbarui setiap 30 hari.");
    }
  }
}

// Implementasi kelas dengan mixin Kinerja
class KaryawanManager extends Karyawan with Kinerja {
  KaryawanManager({required String nama, required int umur, required Role peran})
      : super(nama: nama, umur: umur, peran: peran);

  @override
  void bekerja() {
    print("Manager $nama bekerja dengan produktivitas $produktivitas.");
    if (produktivitas < 85) {
      print("Peringatan: Produktivitas Manager harus di atas 85.");
    }
  }
}

// Enum FaseProyek untuk manajemen proyek
enum FaseProyek { Perencanaan, Pengembangan, Evaluasi }

// Kelas Proyek untuk mengelola fase proyek
class Proyek {
  FaseProyek fase = FaseProyek.Perencanaan;
  final int minimalKaryawan = 5;
  final Duration durasiPengembangan = Duration(days: 45);
  int jumlahKaryawan = 0;
  DateTime tanggalMulai;

  Proyek({required this.tanggalMulai});

  void pindahKeFaseBerikutnya() {
    switch (fase) {
      case FaseProyek.Perencanaan:
        if (jumlahKaryawan >= minimalKaryawan) {
          fase = FaseProyek.Pengembangan;
          print("Proyek berhasil pindah ke fase Pengembangan.");
        } else {
          print("Gagal: Syarat jumlah karyawan tidak terpenuhi.");
        }
        break;
      case FaseProyek.Pengembangan:
        if (DateTime.now().difference(tanggalMulai) > durasiPengembangan) {
          fase = FaseProyek.Evaluasi;
          print("Proyek berhasil pindah ke fase Evaluasi.");
        } else {
          print("Gagal: Proyek belum berjalan selama 45 hari.");
        }
        break;
      case FaseProyek.Evaluasi:
        print("Proyek sudah berada di fase Evaluasi.");
        break;
    }
  }
}

// Kelas Perusahaan untuk manajemen karyawan
class Perusahaan {
  final int batasKaryawan = 20;
  List<Karyawan> karyawanAktif = [];
  List<Karyawan> karyawanNonAktif = [];

  void tambahKaryawan(Karyawan karyawan) {
    if (karyawanAktif.length < batasKaryawan) {
      karyawanAktif.add(karyawan);
      print("Karyawan ${karyawan.nama} berhasil ditambahkan sebagai karyawan aktif.");
    } else {
      print("Batas maksimum karyawan aktif tercapai.");
    }
  }

  void karyawanResign(Karyawan karyawan) {
    if (karyawanAktif.contains(karyawan)) {
      karyawanAktif.remove(karyawan);
      karyawanNonAktif.add(karyawan);
      print("Karyawan ${karyawan.nama} telah resign dan menjadi non-aktif.");
    }
  }

  void tampilkanStatusKaryawan() {
    print("Karyawan Aktif: ${karyawanAktif.map((k) => k.nama).join(", ")}");
    print("Karyawan Non-Aktif: ${karyawanNonAktif.map((k) => k.nama).join(", ")}");
  }
}

// Fungsi utama
void main() {
  // Inisialisasi produk dengan aturan harga
  var produk1 = ProdukDigital(
      namaProduk: "Sistem Manajemen Data",
      harga: 150000,
      kategori: Kategori.DataManagement,
      jumlahTerjual: 60);
  var produk2 = ProdukDigital(
      namaProduk: "Sistem Otomasi Jaringan",
      harga: 300000,
      kategori: Kategori.NetworkAutomation,
      jumlahTerjual: 55);

  // Terapkan diskon pada produk
  produk1.terapkanDiskon();
  produk2.terapkanDiskon();

  // Menambahkan karyawan dan mengecek produktivitas
  var karyawan1 = KaryawanManager(nama: "Ali", umur: 40, peran: Role.Manager);
  karyawan1.perbaruiProduktivitas(90);
  karyawan1.bekerja();

  // Mengelola fase proyek
  var proyek = Proyek(tanggalMulai: DateTime.now().subtract(Duration(days: 50)));
  proyek.jumlahKaryawan = 5;
  proyek.pindahKeFaseBerikutnya();

  // Pengelolaan perusahaan dan karyawan
  var perusahaan = Perusahaan();
  perusahaan.tambahKaryawan(karyawan1);
  perusahaan.karyawanResign(karyawan1);
  perusahaan.tampilkanStatusKaryawan();
}
