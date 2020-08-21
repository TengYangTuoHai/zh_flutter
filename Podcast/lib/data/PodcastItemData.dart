import 'package:xml/xml.dart';

class PodcastItemData {
  String title;
  String link;
  String pubDate;
  String author;
  String enclosure;
  String itunesDuration;
  String itunesImage;
  String description;

  PodcastItemData({
    this.title,
    this.link,
    this.pubDate,
    this.author,
    this.enclosure,
    this.itunesDuration,
    this.itunesImage,
    this.description,
  });

  factory PodcastItemData.fromNode(XmlNode node) {
    return PodcastItemData(
      title: node.findElements("title").single.text,
      link: node.findElements("link").single.text,
      pubDate: node.findElements("pubDate").single.text,
      author: node.findElements("author").single.text,
      enclosure: node.findElements("enclosure").single.getAttribute("url"),
      itunesDuration: node.findElements("itunes:duration").single.text,
      itunesImage:
          node.findElements("itunes:image").single.getAttribute("href"),
      description: node.findElements("description").single.text,
    );
  }

  factory PodcastItemData.empty() {
    return PodcastItemData(
      title: "",
      link: "",
      pubDate: "",
      author: "",
      enclosure: "",
      itunesDuration: "",
      itunesImage: "",
      description: "",
    );
  }
}
