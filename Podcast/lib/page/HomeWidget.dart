import 'dart:convert';

import 'package:Podcast/api/Api_iTunes.dart';
import 'package:Podcast/data/PodcastDetailData.dart';
import 'package:Podcast/data/SearchItemData.dart';
import 'package:Podcast/data/SearchResultData.dart';
import 'package:Podcast/page/PodcastWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeWidget> {
  SearchResultData result = SearchResultData.empty();
  String _searchKey = "";
  bool linearOffstage = true;

  Future<SearchResultData> _fetchSearchResult() async {
    final response = await http.get(Api_iTunes.Search(_searchKey));
    if (response.statusCode == 200) {
      return SearchResultData.fromJson(json.decode(response.body));
    } else {
      return SearchResultData.empty();
    }
  }

  Future<PodcastDetailData> _fetchDeatailData(SearchItemData itemData) async {
    final response = await http.get(itemData.feedUrl);
    if (response.statusCode == 200)
      return PodcastDetailData.fromXml(response.body);
    else
      return PodcastDetailData.empty();
  }

  _searchWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        new ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 25, maxWidth: 200),
          child: new TextField(
            obscureText: false,
            textAlign: TextAlign.center,
            cursorWidth: 2,
            onChanged: (value) => {_searchKey = value},
          ),
        ),
        RaisedButton(
          child: Text("Search"),
          onPressed: () => {_search()},
        ),
      ],
    );
  }

  _search() async {
    setState(() {
      linearOffstage = false;
    });
    SearchResultData searchResult = await _fetchSearchResult();
    setState(() {
      result = searchResult;
      linearOffstage = true;
    });
  }

  _skipToPodcastDetailPage(SearchItemData _itemData) async {
    setState(() {
      linearOffstage = false;
    });
    PodcastDetailData podcastData = await _fetchDeatailData(_itemData);
    setState(() {
      linearOffstage = true;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PodcastWidget(
        data: podcastData,
        searchItemData: _itemData,
      );
    }));
  }

  LinearProgressIndicator linear = new LinearProgressIndicator(
    backgroundColor: Colors.purple,
  );
  CircularProgressIndicator circul = new CircularProgressIndicator(
    backgroundColor: Colors.purple,
  );

  _resultList() {
    return ListView.builder(
      itemCount: result.results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(result.results[index].trackCensoredName),
          subtitle: Text(result.results[index].artistName),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(result.results[index].artworkUrl100),
          ),
          onTap: () => {
            _skipToPodcastDetailPage(result.results[index]),
            print(result.results[index].collectionId),
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Podcast"),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _searchWidget(),
              Text("搜索到${result.resultCount.toString()}条记录"),
              Offstage(
                offstage: linearOffstage,
                child: linear,
              ),
              Expanded(
                child: Container(
                  height: 200,
                  child: _resultList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
