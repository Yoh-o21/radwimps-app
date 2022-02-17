class Album {
  //Albumsクラスにおける変数を定義
  final String title, img;
  final int year;

  //コンストラクタ
  Album(this.title, this.year, this.img);
}

class AlbumController {
  //リストモデル
  List<Album> albums = [
    Album('アルトコロニーの定理', 2009,
        'https://src-radwimps.s3.ap-northeast-1.amazonaws.com/wp-content/uploads/2009/03/17221313/jk_20090311-1.jpg'),
    Album('絶体絶命', 2011,
        'https://src-radwimps.s3.ap-northeast-1.amazonaws.com/wp-content/uploads/2011/03/14141413/jk_zz-1.jpg'),
    Album('×と◯と罪と', 2013,
        'https://src-radwimps.s3.ap-northeast-1.amazonaws.com/wp-content/uploads/2013/12/14142957/jk_xotsumi-1.jpg'),
    Album('人間開花', 2016,
        'https://src-radwimps.s3.ap-northeast-1.amazonaws.com/wp-content/uploads/2016/10/14171739/UPCH-20436.jpg'),
  ];

  //リストの大きさを取得
  int count() {
    return albums.length;
  }

  //指定したインデックスのインスタンスを取得
  Album find(int index) {
    return albums[index];
  }
}
