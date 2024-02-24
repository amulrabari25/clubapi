class APIUrl {
  static const String baseUrlAPI =
      "https://tennisprodev.azurewebsites.net/api/";

  static const String clubListApi = "${baseUrlAPI}V3/ClubList";

  static const String clubDeleteApi = "${baseUrlAPI}V1/clubdetail";

  static const int getSuccessStatusCode = 200;
  static const int postSuccessStatusCode = 201;
  static const int errorStatusCode = 202;
  static const int forceLogoutStatusCode = 203;
  static const int unauthorizedStatusCode = 401;
  static const int notFoundStatusCode = 404;
}
