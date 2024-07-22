import 'package:flutter/material.dart';
import 'package:flutter_perpus/API/APIService.dart';

class FotoBukuScreen extends StatefulWidget {
  final int bukuId;

  FotoBukuScreen({required this.bukuId});

  @override
  _FotoBukuScreenState createState() => _FotoBukuScreenState();
}

class _FotoBukuScreenState extends State<FotoBukuScreen> {
  late Future<Image> _futureImage;

  @override
  void initState() {
    super.initState();
    _futureImage = ApiService.ambilFotoBuku(widget.bukuId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foto Buku'),
      ),
      body: Center(
        child: FutureBuilder<Image>(
          future: _futureImage,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return Text('Tidak ada data');
            } else {
              return Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: snapshot.data!.image,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
