import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Data produk
  List<Map<String, dynamic>> products = [
    {
      "name": "Agak Laen",
      "price": 60000,
      "quantity": 0,
      "image": 'assets/agaklaen.jpeg',
    },
    {
      "name": "Kang Mak",
      "price": 45000,
      "quantity": 0,
      "image": 'assets/kangmak.jpeg',
    },
    {
      "name": "Kuasa Gelap",
      "price": 50000,
      "quantity": 0,
      "image": 'assets/kuasagelap.jpeg',
    },
  ];

  // Format harga menjadi Rupiah
  String formatCurrency(int amount) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    return formatter.format(amount);
  }

  // Total harga
  int get totalPrice {
    return products.fold<int>(
      0,
      (sum, product) {
        int price = (product["price"] is int) ? product["price"] : (product["price"] as double).toInt();
        int quantity = (product["quantity"] is int) ? product["quantity"] : (product["quantity"] as double).toInt();
        return sum + (price * quantity);
      },
    );
  }

  // Diskon 10% jika total pembelian lebih dari 100.000
  double get discount {
    if (totalPrice > 100000) {
      return totalPrice * 0.10;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembelian Tiket'),
        backgroundColor: Colors.blueAccent, // Warna biru yang lebih cerah
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Daftar produk dalam bentuk Card
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              products[index]["image"],
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Nama dan harga produk
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products[index]["name"],
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Harga: ${formatCurrency(products[index]["price"])}',
                                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove, color: Colors.grey),
                                    onPressed: () {
                                      setState(() {
                                        if (products[index]["quantity"] > 0) {
                                          products[index]["quantity"]--;
                                        }
                                      });
                                    },
                                  ),
                                  // Jumlah produk
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.blueAccent,
                                    child: Text(
                                      products[index]["quantity"].toString(),
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  // Tombol tambah
                                  IconButton(
                                    icon: const Icon(Icons.add, color: Colors.grey),
                                    onPressed: () {
                                      setState(() {
                                        products[index]["quantity"]++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Ikon hapus produk di kanan atas
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  products.removeAt(index);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Ringkasan Pesanan dan Total harga
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ringkasan pesanan
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(0, 2))],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ringkasan Pesanan:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        for (var product in products)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(product["name"], style: const TextStyle(fontSize: 14)),
                                Text(
                                  '${product["quantity"]} x ${formatCurrency(product["price"])}',
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 10),
                        // Menampilkan diskon jika berlaku
                        if (discount > 0)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Diskon 10%: ',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '- ${formatCurrency(discount.toInt())}', 
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red),
                              ),
                            ],
                          ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total: ',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              formatCurrency(totalPrice - discount.toInt()), // Menampilkan total setelah diskon
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Fungsi checkout
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      textStyle: const TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.orangeAccent, // Warna oranye
                    ),
                    child: const Text('Checkout', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
