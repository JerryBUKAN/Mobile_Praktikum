class Book {
  final String id;
  final String title;
  final String author;
  final String description;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id']?.toString() ?? '', // Berikan string kosong jika null
      title: json['title'] ?? 'Judul tidak tersedia', // Default jika null
      author: json['author'] ?? 'Penulis tidak diketahui', // Default jika null
      description: json['description'] ?? 'Deskripsi tidak tersedia', // Default jika null
    );
  }
}
