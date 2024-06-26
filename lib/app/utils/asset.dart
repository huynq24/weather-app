const linkAsset = 'assets/images/weathers/';

class AssetCustom {
  static String getLinkImg(String name) =>
      '$linkAsset${name.replaceAll(' ', '').toLowerCase()}.png';
}

class Mykey {
  static const String api_token = '2f0ee1f401a8e5873917620283af80e9';
}
