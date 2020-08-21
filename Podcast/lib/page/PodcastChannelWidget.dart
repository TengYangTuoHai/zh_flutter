import 'package:Podcast/data/PodcastDetailData.dart';
import 'package:Podcast/data/SearchItemData.dart';
import 'package:audioplayers/audioplayers.dart';
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
  AudioPlayer player;

  PodcastChannelState({this.data, this.searchItemData});

  _podcastItemList() {
    return ListView.builder(
      itemCount: data.items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(data.items[index].title),
          subtitle: Text(data.items[index].author),
          onTap: () => {_playPodcast(data.items[index].enclosure)},
        );
      },
    );
  }

  _playPodcast(String url) async {
    AudioPlayer.logEnabled = true;
    player = new AudioPlayer();
    int result = await player.play(url);
    if (result == 1) {
      print("podcast playing");
    } else
      print("play error");
  }

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
                  width: 150,
                  height: 150,
                  image: NetworkImage(data?.imgUrl),
                ),
              ),
              Container(
                height: 100,
                child: Text(data?.description),
              ),
              Expanded(
                child: _podcastItemList(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
