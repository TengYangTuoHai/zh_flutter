import 'package:Podcast/data/PodcastDetailData.dart';
import 'package:Podcast/data/SearchItemData.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PodcastChannelWidget extends StatefulWidget {
  final PodcastChannelData data;
  SearchItemData searchItemData;

  PodcastChannelWidget({this.data, this.searchItemData});

  @override
  State<StatefulWidget> createState() {
    return PodcastChannelState(data: data, searchItemData: searchItemData);
  }
}

class PodcastChannelState extends State<PodcastChannelWidget> {
  PodcastChannelData data;
  SearchItemData searchItemData;

  PodcastChannelState({this.data, this.searchItemData});

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
              Container(
                height: 200,
                child: Text(data?.description),
              )
            ],
          ),
        ],
      ),
    );
  }
}
