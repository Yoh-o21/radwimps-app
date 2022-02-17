import 'package:flutter/material.dart';

class AlbumAboutPage extends StatelessWidget {
  const AlbumAboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: const Center(
          child:
              Text('This is Album About Page', style: TextStyle(fontSize: 20))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.skip_previous),
      ),
    );
  }
}
