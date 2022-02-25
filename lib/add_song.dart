import 'package:cloud_firestore/cloud_firestore.dart';

//追加する楽曲リスト
List<String> list = ['', ''];

void addSongs() {
  for (var i = 0; i < list.length; i++) {
    FirebaseFirestore.instance
        .collection('id_albums')
        .doc('') //楽曲リストを追加したいアルバムのドキュメントID
        .collection('songs')
        .add({'title': list[i], 'id': i + 1});
  }
}
