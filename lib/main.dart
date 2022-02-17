import 'package:flutter/material.dart';
import 'album_list_page.dart';

/// エントリーポイント
void main() {
  runApp(const RadwimpsApp());
}

class RadwimpsApp extends StatelessWidget {
  /// コンストラクタ
  const RadwimpsApp({Key? key}) : super(key: key);

  /// 画面を作成する
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリケーションのタイトル
      title: 'RADWIMPS App',
      // アプリケーションのテーマ
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // Todoリスト画面を生成しホーム画面とする
      home: const AlbumListPage(),
    );
  }
}
