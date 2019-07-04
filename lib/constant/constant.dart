class Constant {
  static const String ASSETS_IMG = 'images/';

  static getAssetImg(String name) {
    return ASSETS_IMG + '$name.png';
  }
}
