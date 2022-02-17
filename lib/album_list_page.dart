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
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                // アルバム詳細ページに遷移
                                builder: (context) => const AlbumAboutPage()));
                      },
                      child: const Image(
                        image: NetworkImage(
                            'https://src-radwimps.s3.ap-northeast-1.amazonaws.com/wp-content/uploads/2013/12/14142957/jk_xotsumi-1.jpg'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('×と◯と罪と')
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
