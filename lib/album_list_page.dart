import 'package:flutter/material.dart';
import 'package:radwimps_app/album_about_page.dart';
import 'package:radwimps_app/for_album.dart';

class AlbumListPage extends StatefulWidget {
  const AlbumListPage({Key? key}) : super(key: key);

  @override
  _AlbumListPageState createState() => _AlbumListPageState();
}

class _AlbumListPageState extends State<AlbumListPage> {
  final AlbumController albumController = AlbumController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Page'),
      ),
      body: GridView.builder(
          padding: const EdgeInsetsDirectional.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4),
          itemCount: albumController.count(),
          itemBuilder: (BuildContext context, int index) {
            var album = albumController.find(index);

            return GestureDetector(
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    children: [
                      Image(
                        fit: BoxFit.contain,
                        image: NetworkImage(album.img),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        album.title,
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              //画像をタップした時の動作
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        // アルバム詳細ページに遷移
                        builder: (context) => AlbumAboutPage(album: album)));
              },
            );
          }),
    );
  }
}
