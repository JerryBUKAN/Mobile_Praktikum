import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int quantity = 1; // Jumlah produk awal
  double price = 100.0; // Harga produk
  double totalPrice = 100.0; // Total harga produk
  double discount = 0.1; // Diskon 10% (ubah sesuai kebutuhan)

  @override
  Widget build(BuildContext context) {
    // Menghitung harga setelah diskon
    double discountedPrice = totalPrice - (totalPrice * discount);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/product_image.png', width: 150, height: 150), // Ganti dengan gambar produk
            const SizedBox(height: 20),
            const Text(
              'Nama Produk', // Nama produk
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Harga: \$${price.toStringAsFixed(2)}', // Menampilkan harga produk
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) {
                        quantity--;
                        totalPrice = quantity * price; // Mengupdate harga total
                      }
                    });
                  },
                ),
                CircleAvatar(
                  radius: 15,
                  child: Text(quantity.toString()), // Menampilkan jumlah produk
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                      totalPrice = quantity * price; // Mengupdate harga total
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Total Harga: \$${totalPrice.toStringAsFixed(2)}', // Menampilkan total harga
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Menampilkan harga setelah diskon
            Text(
              'Harga setelah Diskon: \$${discountedPrice.toStringAsFixed(2)}', // Menampilkan harga setelah diskon
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Tambah ke Keranjang'),
            ),
          ],
        ),
      ),
    );
  }
}
