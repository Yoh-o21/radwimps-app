import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/album.dart';

class AlbumAboutPage extends StatelessWidget {
  final Album album;
  final int index;
  const AlbumAboutPage({Key? key, required this.album, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              margin: const EdgeInsets.only(top: 60, bottom: 10),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 3,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Hero(
                  tag: index, child: Image(image: NetworkImage(album.img))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  album.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat('yyyy年M月d日').format(album.release).toString(),
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            const Divider(
              thickness: 2,
              indent: 30,
              endIndent: 30,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('id_albums')
                  .doc(album.albumId)
                  .collection('songs')
                  .orderBy('id')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                      top: 0, left: 16, right: 16, bottom: 20),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(snapshot.data!.docs[index].get('title')),
                      trailing: const Icon(Icons.music_video),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.skip_previous),
      ),
    );
  }
}
