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
    Album('RADWIMPS', 2003,
        'https://src-radwimps.s3.ap-northeast-1.amazonaws.com/wp-content/uploads/2003/07/17220907/61rENFMZW6L._AC_SL1050_.jpg'),
    Album('RADWIMPS 2 ～発展途上～', 2005,
        'https://src-radwimps.s3.ap-northeast-1.amazonaws.com/wp-content/uploads/2005/03/17221041/jk_hattentojo-1.jpg'),
    Album('RADWIMPS 3 ～無人島に持っていき忘れた一枚～', 2006,
        'https://src-radwimps.s3.ap-northeast-1.amazonaws.com/wp-content/uploads/2006/02/17221147/jk_mujinto-1.jpg'),
    Album('RADWIMPS 4 ～おかずのごはん～', 2006,
        'https://src-radwimps.s3.ap-northeast-1.amazonaws.com/wp-content/uploads/2006/12/17221258/jk_okazu-1.jpg'),
    Album('アルトコロニーの定理', 2009,
        'https://src-radwimps.s3.ap-northeast-1.amazonaws.com/wp-content/uploads/2009/03/17221313/jk_20090311-1.jpg'),
    Album('絶体絶命', 2011,
        'https://src-radwimps.s3.ap-northeast-1.amazonaws.com/wp-content/uploads/2011/03/14141413/jk_zz-1.jpg'),
    Album('×と◯と罪と', 2013,
        'https://src-radwimps.s3.ap-northeast-1.amazonaws.com/wp-content/uploads/2013/12/14142957/jk_xotsumi-1.jpg'),
    Album('人間開花', 2016,
        'https://src-radwimps.s3.ap-northeast-1.amazonaws.com/wp-content/uploads/2016/10/14171739/UPCH-20436.jpg'),
    Album('ANTI ANTI GENERATION', 2018,
        'https://src-radwimps.s3.ap-northeast-1.amazonaws.com/wp-content/uploads/2018/11/17222046/aag_jk_disco-1.jpg'),
    Album('FOREVER DAZE', 2021,
        'https://src-radwimps.s3.ap-northeast-1.amazonaws.com/wp-content/uploads/2021/10/08182337/CD_booklet_H1_small.jpg'),
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
