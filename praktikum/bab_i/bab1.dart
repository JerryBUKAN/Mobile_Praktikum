import 'dart:async';

// Enum Role untuk menentukan peran pengguna
enum Role { Admin, Pelanggan }

// Kelas Product untuk menyimpan data kaos
class Product {
  final String namaProduk;
  final double harga;
  final bool tersedia;

  Product({
    required this.namaProduk,
    required this.harga,
    required this.tersedia,
  });
}

// Kelas abstrak User
abstract class User {
  final String nama;
  final int umur;
  late List<Product> produk;  // late untuk inisialisasi setelah objek dibuat
  Role? peran;

  User({
    required this.nama,
    required this.umur,
    this.peran,
  }) {
    produk = [];
  }

  void lihatProduk() {
    if (produk.isEmpty) {
      print("Tidak ada produk kaos yang tersedia.");
    } else {
      print("Daftar Produk di Online Shop Jerox:");
      for (var produkItem in produk) {
        print("Kaos: ${produkItem.namaProduk}, Harga: ${produkItem.harga}, Tersedia: ${produkItem.tersedia}");
      }
    }
  }
}

// Subkelas AdminUser yang dapat menambah dan menghapus produk
class AdminUser extends User {
  AdminUser({required String nama, required int umur})
      : super(nama: nama, umur: umur, peran: Role.Admin);

  void tambahProduk(Product produkItem) {
    try {
      if (!produkItem.tersedia) {
        throw Exception("Kaos '${produkItem.namaProduk}' tidak tersedia dalam stok.");
      }
      produk.add(produkItem);
      print("Kaos '${produkItem.namaProduk}' berhasil ditambahkan ke Online Shop Jerox.");
    } on Exception catch (e) {
      print("Error: $e");
    }
  }

  void hapusProduk(String namaProduk) {
    produk.removeWhere((produkItem) => produkItem.namaProduk == namaProduk);
    print("Kaos '$namaProduk' berhasil dihapus dari Online Shop Jerox.");
  }
}

// Subkelas CustomerUser yang hanya bisa melihat produk
class CustomerUser extends User {
  CustomerUser({required String nama, required int umur})
      : super(nama: nama, umur: umur, peran: Role.Pelanggan);
}

// Fungsi asinkron untuk mengambil detail produk
Future<Product> ambilDetailProduk(String namaProduk, double harga, bool tersedia) async {
  await Future.delayed(Duration(seconds: 2));
  return Product(namaProduk: namaProduk, harga: harga, tersedia: tersedia);
}

void main() async {
  // Katalog kaos di Online Shop Jerox menggunakan Map untuk menyimpan nama produk sebagai kunci
  Map<String, Product> katalogProduk = {
    'Kaos Polos': Product(namaProduk: 'Kaos Polos', harga: 100.00, tersedia: true),
    'Kaos Bergambar': Product(namaProduk: 'Kaos Bergambar', harga: 150.00, tersedia: true),
    'Kaos Lengan Panjang': Product(namaProduk: 'Kaos Lengan Panjang', harga: 200.00, tersedia: false),
  };

  // Gunakan Set untuk menjaga keunikan produk yang ditambahkan
  Set<Product> produkUnik = {};
  produkUnik.addAll(katalogProduk.values);

  // Membuat pengguna Admin dan Pelanggan
  AdminUser admin = AdminUser(nama: 'Alice', umur: 30);
  CustomerUser pelanggan = CustomerUser(nama: 'Bob', umur: 25);

  // Admin menambahkan kaos ke daftar produk
  for (var produkItem in produkUnik) {
    try {
      admin.tambahProduk(produkItem);
    } catch (e) {
      print("Error: $e");
    }
  }

  print("\nPelanggan melihat produk di Online Shop Jerox:");
  pelanggan.produk = admin.produk;
  pelanggan.lihatProduk();

  print("\nMengambil detail kaos tambahan...");
  Product produkBaru = await ambilDetailProduk('Kaos Sport', 120.00, true);
  print("Kaos baru: ${produkBaru.namaProduk}, Harga: ${produkBaru.harga}, Tersedia: ${produkBaru.tersedia}");
}
