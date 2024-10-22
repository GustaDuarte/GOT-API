class Character {
  final String fullName;
  final String imageUrl;
  const Character({required this.fullName, required this.imageUrl});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(fullName: json['fullName'], imageUrl: json["imageUrl"]);
  }
}
