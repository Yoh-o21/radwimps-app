import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:radwimps_app/album.dart';
import 'album_about_page.dart';

class AlbumListPage extends StatefulWidget {
  const AlbumListPage({Key? key}) : super(key: key);

  @override
  _AlbumListPageState createState() => _AlbumListPageState();
}

class _AlbumListPageState extends State<AlbumListPage> {
  var isDecending = false;
  Query<Map<String, dynamic>> albums =
      FirebaseFirestore.instance.collection('id_albums').orderBy('release');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アルバム一覧'),
      ),
      body: _gridview(albums),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.sort_rounded),
        onPressed: () {
          setState(() {
            isDecending == true
                ? albums = FirebaseFirestore.instance
                    .collection('id_albums')
                    .orderBy('release', descending: false)
                : albums = FirebaseFirestore.instance
                    .collection('id_albums')
                    .orderBy('release', descending: true);
            isDecending = !isDecending;
          });
        },
      ),
    );
  }
}

Widget _gridview(Query albums) {
  return Center(
    child: StreamBuilder(
      stream: albums.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemCount: snapshot.data!.docs.length,
          padding: const EdgeInsets.all(2),
          itemBuilder: (BuildContext context, int index) {
            Album album = Album(
                snapshot.data!.docs[index].get('title'),
                snapshot.data!.docs[index].get('year'),
                snapshot.data!.docs[index].get('img'),
                snapshot.data!.docs[index].id.toString());
            return GestureDetector(
              //画像を押したときの挙動
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        // アルバム詳細ページに遷移
                        builder: (context) =>
                            AlbumAboutPage(album: album, index: index)));
              },

              child: Card(
                elevation: 2,
                child: Hero(
                  tag: index,
                  child: Image(
                    fit: BoxFit.contain,
                    image: NetworkImage(album.img),
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
