class Album {
  final String title;

  const Album({
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['title'],
    );
  }