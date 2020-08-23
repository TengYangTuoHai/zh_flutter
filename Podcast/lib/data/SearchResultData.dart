import 'package:Podcast/data/SearchItemData.dart';

class SearchResultData {
  int resultCount;
  List<SearchItemData> results;
  SearchResultData({this.resultCount, this.results});

  factory SearchResultData.fromJson(Map<String, dynamic> j) {
    var resList = j["results"] as List;
    List<SearchItemData> indexList =
        resList.map((i) => SearchItemData.fromJson(i)).toList();

    return SearchResultData(
      resultCount: j["resultCount"],
      results: indexList,
    );
  }

  factory SearchResultData.empty() {
    return SearchResultData(resultCount: 0, results: new List());
  }
}
