class Buku {
  final int id;
  final String namaBuku;
  final String tahunTerbit;
  final int stock;
  final int kategori;
  final int penerbit;
  final int pengarang;
  final String harga;
  final String foto;
  final String deskripsi;
  final String jenisBuku;

  Buku({
    required this.id,
    required this.namaBuku,
    required this.tahunTerbit,
    required this.stock,
    required this.kategori,
    required this.penerbit,
    required this.pengarang,
    required this.harga,
    required this.foto,
    required this.deskripsi,
    required this.jenisBuku,
  });

  factory Buku.fromJson(Map<String, dynamic> json) {
    return Buku(
      id: json['id'],
      namaBuku: json['nama_buku'],
      tahunTerbit: json['tahun_terbit'],
      stock: json['stock'],
      kategori: json['kategori'],
      penerbit: json['penerbit'],
      pengarang: json['pengarang'],
      harga: json['harga'],
      foto: json['foto'],
      deskripsi: json['deskripsi'],
      jenisBuku: json['jenisbuku'],
    );
  }
}

class BookContent {
  String image;
  String title;
  String description;
  String author;
  String publisher;
  String releaseDate;
  List<String> tags;
  double rating;

  BookContent({
    required this.image,
    required this.title,
    required this.description,
    required this.author,
    required this.publisher,
    required this.releaseDate,
    required this.tags,
    required this.rating,
  });
}

List<BookContent> bookContents = [
  BookContent(
    image: 'images/book.jpg',
    title: 'The Alchemist',
    description:
        'The Alchemist follows the journey of an Andalusian shepherd boy named Santiago. Believing a recurring dream to be prophetic, he decides to travel to a Romani fortune-teller in a nearby town to discover its meaning. The woman interprets the dream as a prophecy telling the boy that he will discover a treasure at the Egyptian pyramids.',
    author: 'Paulo Coelho',
    publisher: 'HarperCollins',
    releaseDate: 'April 1988',
    tags: ['Fiction', 'Philosophical novel'],
    rating: 4.3,
  ),
  BookContent(
    image: 'images/book2.jpg',
    title: 'The Little Prince',
    description:
        'The Little Prince, first published in 1943, is a novella and the most famous work of the French writer and aviator Antoine de Saint-Exupéry. The story is philosophical and includes social criticism, remarking on the strangeness of the adult world.',
    author: 'Antoine de Saint-Exupéry',
    publisher: 'Reynal & Hitchcock',
    releaseDate: 'April 1943',
    tags: ['Children\'s literature', 'Novella'],
    rating: 4.6,
  ),
  BookContent(
    image: 'images/book3.jpg',
    title: 'The Alchemist',
    description:
        'The Alchemist follows the journey of an Andalusian shepherd boy named Santiago. Believing a recurring dream to be prophetic, he decides to travel to a Romani fortune-teller in a nearby town to discover its meaning. The woman interprets the dream as a prophecy telling the boy that he will discover a treasure at the Egyptian pyramids.',
    author: 'Paulo Coelho',
    publisher: 'HarperCollins',
    releaseDate: 'April 1988',
    tags: ['Fiction', 'Philosophical novel'],
    rating: 4.3,
  ),
  BookContent(
    image: 'images/book4.jpg',
    title: 'The Little Prince',
    description:
        'The Little Prince, first published in 1943, is a novella and the most famous work of the French writer and aviator Antoine de Saint-Exupéry. The story is philosophical and includes social criticism, remarking on the strangeness of the adult world.',
    author: 'Antoine de Saint-Exupéry',
    publisher: 'Reynal & Hitchcock',
    releaseDate: 'April 1943',
    tags: ['Children\'s literature', 'Novella'],
    rating: 4.6,
  ),
  BookContent(
    image: 'images/book5.jpg',
    title: 'The Alchemist',
    description:
        'The Alchemist follows the journey of an Andalusian shepherd boy named Santiago. Believing a recurring dream to be prophetic, he decides to travel to a Romani fortune-teller in a nearby town to discover its meaning. The woman interprets the dream as a prophecy telling the boy that he will discover a treasure at the Egyptian pyramids.',
    author: 'Paulo Coelho',
    publisher: 'HarperCollins',
    releaseDate: 'April 1988',
    tags: ['Fiction', 'Philosophical novel'],
    rating: 4.3,
  ),
  BookContent(
    image: 'images/book6.jpg',
    title: 'The Little Prince',
    description:
        'The Little Prince, first published in 1943, is a novella and the most famous work of the French writer and aviator Antoine de Saint-Exupéry. The story is philosophical and includes social criticism, remarking on the strangeness of the adult world.',
    author: 'Antoine de Saint-Exupéry',
    publisher: 'Reynal & Hitchcock',
    releaseDate: 'April 1943',
    tags: ['Children\'s literature', 'Novella'],
    rating: 4.6,
  ),
];
