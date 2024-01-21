class Course {
  String name;
  String description;
  String pathPdf;
  String couverture;
  String size;

  Course({
    required this.name,
    required this.description,
    required this.pathPdf,
    required this.couverture,
    required this.size,

  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'pathPdf': pathPdf,
      'couverture': couverture,
      'size': size,
    };
  }
}
