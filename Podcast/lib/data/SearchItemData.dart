class SearchItemData {
  String wrapperType;
  String kind;
  int artistId;
  int collectionId;
  int trackId;
  String artistName;
  String collectionName;
  String trackName;
  String collectionCensoredName;
  String trackCensoredName;
  String artistViewUrl;
  String collectionViewUrl;
  String feedUrl;
  String trackViewUrl;
  String artworkUrl30;
  String artworkUrl60;
  String artworkUrl100;
  String releaseDate;
  String collectionExplicitness;
  String trackExplicitness;
  int trackCount;

  SearchItemData({
    this.wrapperType,
    this.kind,
    this.artistId,
    this.collectionId,
    this.trackId,
    this.artistName,
    this.collectionName,
    this.trackName,
    this.collectionCensoredName,
    this.trackCensoredName,
    this.artistViewUrl,
    this.collectionViewUrl,
    this.feedUrl,
    this.trackViewUrl,
    this.artworkUrl30,
    this.artworkUrl60,
    this.artworkUrl100,
    this.releaseDate,
    this.collectionExplicitness,
    this.trackExplicitness,
    this.trackCount,
  });

  factory SearchItemData.fromJson(Map<String, dynamic> json) {
    return SearchItemData(
      wrapperType: json['wrapperType'],
      kind: json['kind'],
      artistId: json['artistId'],
      collectionId: json['collectionId'],
      trackId: json['trackId'],
      artistName: json['artistName'],
      collectionName: json['collectionName'],
      trackName: json['trackName'],
      collectionCensoredName: json['collectionCensoredName'],
      trackCensoredName: json['trackCensoredName'],
      artistViewUrl: json['artistViewUrl'],
      collectionViewUrl: json['collectionViewUrl'],
      feedUrl: json['feedUrl'],
      trackViewUrl: json['trackViewUrl'],
      artworkUrl30: json['artworkUrl30'],
      artworkUrl60: json['artworkUrl60'],
      artworkUrl100: json['artworkUrl100'],
      releaseDate: json['releaseDate'],
      collectionExplicitness: json['collectionExplicitness'],
      trackExplicitness: json['trackExplicitness'],
      trackCount: json['trackCount'],
    );
  }
}
