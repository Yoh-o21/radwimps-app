import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:radwimps_app/album_about_page.dart';
import 'package:radwimps_app/for_album.dart';

class AlbumListPage extends StatefulWidget {
  const AlbumListPage({Key? key}) : super(key: key);

  @override
  _AlbumListPageState createState() => _AlbumListPageState();
}

class _AlbumListPageState extends State<AlbumListPage> {
  final AlbumController albumController = AlbumController();
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('id_albums').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album View'),
      ),

      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return ListTile(
                  title: Text(data['title']),
                );
              }).toList(),
            );
          },
        ),
      ),
      // body: GridView.builder(
      //   padding: const EdgeInsetsDirectional.all(12),
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
      //   itemCount: albumController.count(),
      //   itemBuilder: (BuildContext context, int index) {
      //     var album = albumController.find(index);
      //     int id = index;

      //     //タップイベントを持ったGrid Viewの画像リスト
      //     return GestureDetector(
      //       child: Card(
      //         elevation: 2,
      //         child: Hero(
      //           tag: 'jacket_$id',
      //           child: Image(
      //             fit: BoxFit.contain,
      //             image: NetworkImage(album.img),
      //           ),
      //         ),
      //       ),

      //       //画像を押したときの挙動
      //       onTap: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 // アルバム詳細ページに遷移
      //                 builder: (context) =>
      //                     AlbumAboutPage(album: album, id: index)));
      //       },

      //       //画像を長押しした時の動作
      //       // onLongPress: () {
      //       //   //長押ししたらアルバム名が表示される挙動を実装したい
      //       // },
      //     );
      //   },
      // ),
    );
  }
}
