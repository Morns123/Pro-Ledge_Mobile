import 'package:flutter/material.dart';

import 'model/bookModel.dart';

class BookDetailScreen extends StatelessWidget {
  final Buku book;

  BookDetailScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.namaBuku),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Harga: ${book.harga}'),
            Text('Deskripsi: ${book.deskripsi}'),
            // Tambahkan informasi buku lainnya sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
