import 'package:flelobna/models/commentaire.dart';

class Course {
  String? name;
  String? description;
  String? pathPdf;
  String? couverture;
  String? size;
  int? favorite;
  List<Commentaire>? commentaire;

  Course({
    this.name,
    this.description,
    this.pathPdf,
    this.couverture,
    this.size,
    this.favorite,
    this.commentaire, // Corrected this part
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'pathPdf': pathPdf,
      'couverture': couverture,
      'size': size,
      'favorite': favorite,
      'commentaire': commentaire?.map((c) => c.toJson()).toList(),
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    List<Commentaire>? commentaire = map['commentaire'] != null
        ? List<Map<String, dynamic>>.from(map['commentaire'])
            .map((commentData) => Commentaire.fromMap(commentData))
            .toList()
        : null;

    return Course(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      pathPdf: map['pathPdf'] ?? '',
      couverture: map['couverture'] ?? '',
      size: map['size'] ?? '',
      favorite: map['favorite'] ?? 0,
      commentaire: commentaire,
    );
  }

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      name: json['name'],
      description: json['description'],
      pathPdf: json['pathPdf'],
      couverture: json['couverture'],
      size: json['size'],
      favorite: json['favorite'],
      commentaire: json['commentaire'] != null
          ? List<Commentaire>.from(
              json['commentaire'].map((model) => Commentaire.fromJson(model)))
          : null,
    );
  }
}
