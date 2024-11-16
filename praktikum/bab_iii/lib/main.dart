import 'package:flutter/material.dart';
// import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M.tiX',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("M.tiX"),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.indigo),
                  hintText: 'Search Film',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 26, 129, 81),
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 8, 13, 44),
                      Colors.indigo.shade400
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Today's Special Deal!",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "By One Get One",
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 4, 0, 255)),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Limited Time Offer. Buy Now!",
                            style: TextStyle(color: Colors.white70),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  const Color.fromARGB(255, 248, 248, 247),
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 3, 3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text("Buy Now"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "image/kadet1947.jpeg",
                        width: 250,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // sedang tayang
            const SectionHeader(title: "Sedang Tayang"),

            // Film List
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // Hentikan setelah satu item
                  if (index > 0) return null;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(
                                8), // Tambahkan border radius jika ingin sedikit melengkung
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 4,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            "image/user.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text("Freelance 1",
                            style:
                                 TextStyle(fontWeight: FontWeight.bold)),
                        const Text("Web Design",
                            style: TextStyle(color: Colors.grey)),
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Text("5.0"),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Top Services
            const SectionHeader(title: "Akan Tayang"),

            // Services List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                // Hentikan setelah satu item
                if (index > 0) return null;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "image/freelance1.jpeg",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Santet Segoro Pitu",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Genre : Horror",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  "Sutradara Tommy Dewo",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.amber, size: 16),
                                    Text("9.0"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.indigo,
                              backgroundColor: Colors.indigo.shade100,
                            ),
                            child: const Text("Lihat Trailer"),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                // Hentikan setelah satu item
                if (index > 0) return null;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "image/freelance1.jpeg",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Santet Segoro Pitu",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Genre : Horror",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  "Sutradara Tommy Dewo",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.amber, size: 16),
                                    Text("9.0"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.indigo,
                              backgroundColor: Colors.indigo.shade100,
                            ),
                            child: const Text("Lihat Trailer"),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                // Hentikan setelah satu item
                if (index > 0) return null;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "image/freelance1.jpeg",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const  Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Santet Segoro Pitu",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Genre : Horror",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  "Sutradara Tommy Dewo",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.amber, size: 16),
                                    Text("9.0"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.indigo,
                              backgroundColor: Colors.indigo.shade100,
                            ),
                            child: const Text("Lihat Trailer"),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                // Hentikan setelah satu item
                if (index > 0) return null;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "image/freelance1.jpeg",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Santet Segoro Pitu",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Genre : Horror",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  "Sutradara Tommy Dewo",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.amber, size: 16),
                                    Text("9.0"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.indigo,
                              backgroundColor: Colors.indigo.shade100,
                            ),
                            child: const Text("Lihat Trailer"),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo),
          ),
          TextButton(
            onPressed: () {},
            child:
                const Text("View All", style: TextStyle(color: Colors.indigo)),
          ),
        ],
      ),
    );
  }
}
