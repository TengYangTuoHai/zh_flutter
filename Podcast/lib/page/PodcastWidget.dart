import 'package:Podcast/data/PodcastDetailData.dart';
import 'package:Podcast/data/SearchItemData.dart';
import 'package:flutter/material.dart';

class PodcastWidget extends StatefulWidget {
  final PodcastDetailData data;
  SearchItemData searchItemData;

  PodcastWidget({this.data, this.searchItemData});

  @override
  State<StatefulWidget> createState() {
    return PodcastState(data: data, searchItemData: searchItemData);
  }
}

class PodcastState extends State<PodcastWidget> {
  PodcastDetailData data;
  SearchItemData searchItemData;

  PodcastState({this.data, this.searchItemData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data?.title),
        centerTitle: true,
      ),
      body: new Stack(
        fit: StackFit.expand,
        children: [
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: Image(
                  width: 200,
                  height: 200,
                  image: NetworkImage(data?.imgUrl),
                ),
              ),
              Text(data?.description),
            ],
          ),
        ],
      ),
    );
  }
}
