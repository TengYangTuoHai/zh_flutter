import 'package:Podcast/data/PodcastItemData.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayerWidget extends StatefulWidget {
  PodcastItemData podcastData;

  PlayerWidget({this.podcastData});

  @override
  State<StatefulWidget> createState() {
    return PlayerState(podcastData: podcastData);
  }
}

class PlayerState extends State<PlayerWidget> {
  PodcastItemData podcastData = PodcastItemData.empty();
  bool isPlaying = false;
  AudioPlayer player;

  PlayerState({this.podcastData}) {
    _playPodcast();
  }

  _playPodcast() async {
    player = new AudioPlayer();
    int result = await player.play(podcastData?.enclosure);
    if (result == 1) {
      setState(() {
        isPlaying = true;
      });
      print("podcast playing");
    } else {
      setState(() {
        isPlaying = false;
      });
      print("play error");
    }
  }

  _playButtonClickEvent() {
    if (isPlaying)
      player.pause();
    else
      player.resume();
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(podcastData?.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
            child: Card(
              shadowColor: Colors.black,
              child: Image(
                width: 300,
                height: 300,
                image: NetworkImage(podcastData.itunesImage),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.skip_previous,
                ),
                onPressed: () => {
                  print("previous button is clicked"),
                },
              ),
              IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () => {
                  print("play button is clicked"),
                  _playButtonClickEvent(),
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.skip_next,
                ),
                onPressed: () => {
                  print("next button is clicked"),
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if(player != null){
      player.release();
    }
  }
}
