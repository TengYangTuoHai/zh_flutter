import 'package:Podcast/data/PodcastItemData.dart';
import 'package:xml/xml.dart';

class PodcastChannelData {
  String title;
  String link;
  String description;
  String imgUrl;
  List<PodcastItemData> items;

  PodcastChannelData({this.title, this.link, this.description, this.items});

  factory PodcastChannelData.fromXml(String xmlDoc) {
    final document = XmlDocument.parse(xmlDoc);
    PodcastChannelData detailData = new PodcastChannelData();
    var channels = document.findAllElements("channel");
    var node = channels.single;
    detailData.title = node.findElements("title").single.text;
    detailData.link = node.findElements("link").single.text;
    detailData.description = node.findElements("description").single.text;
    detailData.imgUrl =
        node.findElements("itunes:image").single.getAttribute("href");
    var items = node.findAllElements("item");
    detailData.items = new List();
    for (XmlNode item in items) {
      detailData.items.add(PodcastItemData.fromNode(item));
    }

    return detailData;
  }

  factory PodcastChannelData.empty() {
    return PodcastChannelData(
      title: "",
      link: "",
      description: "",
      items: new List(),
    );
  }
}
