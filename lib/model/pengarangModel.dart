class Pengarang {
  final int id;
  final String nama;

  Pengarang({required this.id, required this.nama});

  factory Pengarang.fromJson(Map<String, dynamic> json) {
    return Pengarang(
      id: json['id'],
      nama: json['nama'],
    );
  }
}
