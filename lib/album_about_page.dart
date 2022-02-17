import 'package:flutter/material.dart';
import 'for_album.dart';

class AlbumAboutPage extends StatelessWidget {
  final Album album;
  final int id;
  const AlbumAboutPage({Key? key, required this.album, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Card(
            elevation: 24,
            child: Hero(
                tag: 'jacket_$id',
                child: Image(image: NetworkImage(album.img)))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.skip_previous),
      ),
    );
  }
}
