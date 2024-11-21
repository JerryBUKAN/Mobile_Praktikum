import 'package:http/http.dart' as http;

Future<void> deleteBook(String id) async {
  final url = 'https://events.hmti.unkhair.ac.id/api/books/$id';

  try {
    final response = await http.delete(Uri.parse(url));

    // Debugging: Menampilkan status code dan body response
    // ignore: avoid_print
    print('Status Code: ${response.statusCode}');
    // ignore: avoid_print
    print('Response Body: ${response.body}');

    // Memeriksa status code yang valid untuk penghapusan
    if (response.statusCode == 204) {
      // ignore: avoid_print
      print('Buku dengan ID $id berhasil dihapus');
    } else if (response.statusCode == 404) {
      throw Exception('Buku tidak ditemukan dengan ID: $id');
    } else if (response.statusCode == 500) {
      throw Exception('Terjadi kesalahan di server');
    } else {
      throw Exception('Gagal menghapus buku: ${response.statusCode} - ${response.body}');
    }
  } catch (e) {
    // ignore: avoid_print
    print("Error saat menghapus buku: $e");
    throw Exception('Terjadi kesalahan saat menghapus buku: $e');
  }
}
