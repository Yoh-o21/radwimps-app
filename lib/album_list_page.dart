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
  @override
  Widget build(BuildContext context) {
    Query<Map<String, dynamic>> albums =
        FirebaseFirestore.instance.collection('id_albums').orderBy('id');

    return Scaffold(
        appBar: AppBar(
          title: const Text('アルバム一覧'),
        ),
        body: Center(
          child: StreamBuilder(
            stream: albums.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: snapshot.data!.docs.length,
                padding: const EdgeInsets.all(2),
                itemBuilder: (BuildContext context, int index) {
                  Album album = Album(
                      snapshot.data?.docs[index].get('title'),
                      snapshot.data?.docs[index].get('year'),
                      snapshot.data?.docs[index].get('img'));
                  // var album = albumController.find(index);
                  return GestureDetector(
                    //画像を押したときの挙動
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              // アルバム詳細ページに遷移
                              builder: (context) =>
                                  AlbumAboutPage(album: album, id: index)));
                    },

                    child: Card(
                      elevation: 2,
                      child: Hero(
                        tag: index,
                        child: Image(
                          fit: BoxFit.contain,
                          image:
                              NetworkImage(snapshot.data?.docs[index]['img']),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ));
  }
}
