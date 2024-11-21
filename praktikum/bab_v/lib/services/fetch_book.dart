import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/book_model.dart';

Future<List<Book>> fetchBooks() async {
  final response = await http.get(Uri.parse('https://events.hmti.unkhair.ac.id/api/books'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((book) => Book.fromJson(book)).toList();
  } else {
    throw Exception('Gagal memuat buku');
  }
}
