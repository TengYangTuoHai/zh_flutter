import 'package:xml/xml.dart';

class PodcastDetailData {
  String title;
  String link;
  String description;
  String imgUrl;

  PodcastDetailData({this.title, this.link, this.description});

  factory PodcastDetailData.fromXml(String xmlDoc) {
    final document = XmlDocument.parse(xmlDoc);
    PodcastDetailData detailData = new PodcastDetailData();
    var channels = document.findAllElements("channel");
    for (var node in channels) {
      detailData.title = node.findElements("title").single.text;
      detailData.link = node.findElements("link").single.text;
      detailData.description = node.findElements("description").single.text;
      detailData.imgUrl =
          node.findElements("itunes:image").single.getAttribute("href");
    }

    return detailData;
  }

  factory PodcastDetailData.empty() {
    return PodcastDetailData(
      title: "",
      link: "",
      description: "",
    );
  }
}
