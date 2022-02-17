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
      body: GridView.builder(
          padding: const EdgeInsetsDirectional.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemCount: 16,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            // アルバム詳細ページに遷移
                            builder: (context) => const AlbumAboutPage()));
                  },
                  child: const Image(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                        'https://src-radwimps.s3.ap-northeast-1.amazonaws.com/wp-content/uploads/2013/12/14142957/jk_xotsumi-1.jpg'),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
