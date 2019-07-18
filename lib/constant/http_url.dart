class HttpUrl {
  static const String BASE_URL = 'http://47.95.234.176:81/api/';

  static getGuideListUrl(int page) {
    return BASE_URL + 'user/tourist/list/noAuth?page=$page&size=15';
  }
}
