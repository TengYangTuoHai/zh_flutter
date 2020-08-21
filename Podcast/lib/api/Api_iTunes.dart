// ignore: camel_case_types
class Api_iTunes {
  static String country = "cn";
  static final String api = "https://itunes.apple.com/search?";

  // ignore: non_constant_identifier_names
  static String Search(String key) {
    return "${api}term=$key&entity=podcast&limit=9999&country=$country";
    // return "${api}term=$key&country=$country";
  }

  // ignore: non_constant_identifier_names
  static String SearchWithCount(String key, int count) {
    return "${api}term=$key&limit=$count&country=$country";
  }

  // ignore: non_constant_identifier_names
  static String SearchWithKind(String key, String kind) {
    return "${api}term=$key&entity=$kind&country=$country";
  }
}
