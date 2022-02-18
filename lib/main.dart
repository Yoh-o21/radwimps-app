import 'package:flutter/material.dart';
import 'album_list_page.dart';

/// エントリーポイント
void main() {
  runApp(const RadwimpsApp());
}

class RadwimpsApp extends StatelessWidget {
  /// コンストラクタ
  const RadwimpsApp({Key? key}) : super(key: key);

  /// 画面描画
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリケーションのタイトル
      title: 'RADWIMPS App',
      //テーマ
      // theme: ThemeData(primarySwatch: Colors.green),
      //ダークテーマ
      theme: ThemeData.dark(),

      // アルバムリスト画面を生成しホーム画面とする
      home: const AlbumListPage(),
    );
  }
}
