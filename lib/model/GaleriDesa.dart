class GaleriDesa {
  final String id;
  final String thumbnail;
  final String albumTitle;

  GaleriDesa({this.id, this.thumbnail, this.albumTitle});

  factory GaleriDesa.fromJson(Map<String, dynamic> json) {
    String album = json['albumTitle'] as String;

    List<String> arr = album.split(':');

    return GaleriDesa(
      id: json['id'] as String,
      thumbnail: json['thumbnail'] as String,
      albumTitle: arr[1],
    );
  }
}
