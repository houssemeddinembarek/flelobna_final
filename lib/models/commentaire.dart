class Commentaire {
  String? content;
  String? userId;
  DateTime? createdAt;

  Commentaire({
    this.content,
    this.userId,
    this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'content': content,
    'userId': userId,
    'createdAt': createdAt?.toIso8601String(),
  };

  factory Commentaire.fromMap(Map<String, dynamic> map) {
    return Commentaire(
      content: map['content'],
      userId: map['userId'],
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'userId': userId,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  factory Commentaire.fromJson(Map<String, dynamic> json) => Commentaire(
    content: json['content'],
    userId: json['userId'],
    createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
  );
}
