import 'package:flutter/material.dart';
import 'album.dart';

class AlbumAboutPage extends StatelessWidget {
  final Album album;
  final int id;
  const AlbumAboutPage({Key? key, required this.album, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          album.title,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Card(
                elevation: 24,
                child: Hero(
                    tag: id, child: Image(image: NetworkImage(album.img)))),
          ),
          const Divider(
            thickness: 2,
          ),
          Text(album.year.toString() + '年',
              style: const TextStyle(fontSize: 30)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.skip_previous),
      ),
    );
  }
}
