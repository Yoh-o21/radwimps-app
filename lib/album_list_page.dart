import 'package:flutter/material.dart';
import 'package:radwimps_app/album_about_page.dart';

class AlbumListPage extends StatefulWidget {
  const AlbumListPage({Key? key}) : super(key: key);

  @override
  _AlbumListPageState createState() => _AlbumListPageState();
}

class _AlbumListPageState extends State<AlbumListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Page'),
      ),
      body: const Center(
          child:
              Text('This is Album List Page', style: TextStyle(fontSize: 20))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  // （2） 実際に表示するページ(ウィジェット)を指定する
                  builder: (context) => const AlbumAboutPage()));
        },
        child: const Icon(Icons.skip_next),
      ),
    );
  }
}
