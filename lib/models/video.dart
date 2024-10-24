class Video {
  String title;
  String description;
  String videoPath;
  String name;
  String direction;
  String inspectrice;
  String category;

  Video({
    required this.title,
    required this.description,
    required this.videoPath,
    required this.name,
    required this.direction,
    required this.inspectrice,
    required this.category,
  });

  // From JSON method
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      title: json['title'] as String,
      description: json['description'] as String,
      videoPath: json['videoPath'] as String,
      name: json['name'] as String,
      direction: json['direction'] as String,
      inspectrice: json['inspectrice'] as String,
      category: json['category'] as String,
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'videoPath': videoPath,
      'name': name,
      'direction': direction,
      'inspectrice': inspectrice,
      'category': category,
    };
  }
}
