import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:radwimps_app/album.dart';
import 'album_about_page.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AlbumListPage extends StatefulWidget {
  const AlbumListPage({Key? key}) : super(key: key);

  @override
  _AlbumListPageState createState() => _AlbumListPageState();
}

class _AlbumListPageState extends State<AlbumListPage> {
  var isDecending = false;
  var isOriginalAlbum = false;
  Query<Map<String, dynamic>> albums =
      FirebaseFirestore.instance.collection('id_albums').orderBy('release');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アルバム一覧'),
        actions: [
          //フィルター機能
          IconButton(
              onPressed: () => setState(() {
                    isOriginalAlbum == true
                        ? albums = FirebaseFirestore.instance
                            .collection('id_albums')
                            .orderBy('release', descending: false)
                        : albums = FirebaseFirestore.instance
                            .collection('id_albums')
                            .where('isOriginalAlbum', isEqualTo: true);
                    isOriginalAlbum = !isOriginalAlbum;
                  }),
              icon: const Icon(Icons.filter)),
          //ソート機能
          IconButton(
              onPressed: () => setState(() {
                    isDecending == true
                        ? albums = FirebaseFirestore.instance
                            .collection('id_albums')
                            .orderBy('release', descending: false)
                        : albums = FirebaseFirestore.instance
                            .collection('id_albums')
                            .orderBy('release', descending: true);
                    isDecending = !isDecending;
                  }),
              icon: const Icon(Icons.sort))
        ],
      ),
      body: _gridview(albums),
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
            var arg = snapshot.data!.docs[index];
            DateTime release = arg.get('release').toDate();
            Album album = Album(
                arg.get('title'), release, arg.get('img'), arg.id.toString());
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
                  child: CachedNetworkImage(
                    imageUrl: album.img,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  // child: Image(
                  //   fit: BoxFit.contain,
                  //   image: NetworkImage(album.img)
                  // ),
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
