import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  // Method untuk mengambil semua data buku
  static Future<List<dynamic>> getAllBooks() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/bukus'));

      if (response.statusCode == 200) {
        // Jika request sukses (status code 200)
        List<dynamic> books = json.decode(response.body)['bukus'];
        return books;
      } else {
        // Jika request gagal
        throw Exception('Failed to load books');
      }
    } catch (e) {
      // Jika terjadi kesalahan lain
      throw Exception('Error: $e');
    }
  }

  // Method untuk mengambil data buku berdasarkan nama
  static Future<List<dynamic>> getBooksByName(String name) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/bukus/{name}'));

      if (response.statusCode == 200) {
        // Jika request sukses (status code 200)
        List<dynamic> books = json.decode(response.body)['data'];
        return books;
      } else {
        // Jika request gagal
        throw Exception('Failed to load books by name');
      }
    } catch (e) {
      // Jika terjadi kesalahan lain
      throw Exception('Error: $e');
    }
  }

  static Future<Image> ambilFotoBuku(int id) async {
    try {
      // Buat URL endpoint untuk mengambil foto berdasarkan ID
      String url = '$baseUrl/foto/$id';

      // Kirim permintaan GET ke endpoint
      final response = await http.get(Uri.parse(url));

      // Periksa jika respons berhasil (status code 200)
      if (response.statusCode == 200) {
        // Decode respons berupa bytes dari gambar
        final bytes = response.bodyBytes;

        // Buat image dari bytes yang diterima
        Image image = Image.memory(bytes, fit: BoxFit.cover); // Atur sesuai kebutuhan, misalnya fit: BoxFit.fill

        return image;
      } else {
        // Jika tidak berhasil, tampilkan pesan atau throw exception sesuai kebutuhan
        throw Exception(
            'Gagal mengambil foto. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Tangani error jika terjadi
      print('Error: $e');
      rethrow; // Melempar kembali exception untuk ditangani di tempat pemanggilan
    }
  }

  // Method untuk menangani kesalahan umum
  static Future<void> handleError(dynamic e) {
    // Menangani kesalahan sesuai kebutuhan aplikasi Anda
    print('Error: $e');
    throw Exception('Error: $e');
  }
}
