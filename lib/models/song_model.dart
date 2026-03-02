class SongModel {
  String playlistName;
  String songName;
  String artist;
  String link;

  SongModel({
    required this.playlistName,
    required this.songName,
    required this.artist,
    required this.link,
  });

  Map<String, dynamic> toJson() => {
    'playlistName': playlistName,
    'songName': songName,
    'artist': artist,
    'link': link,
  };

  factory SongModel.fromJson(Map<String, dynamic> json) => SongModel(
    playlistName: json['playlistName'],
    songName: json['songName'],
    artist: json['artist'],
    link: json['link'],
  );
}
