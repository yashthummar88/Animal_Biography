class Animal {
  int? id;
  final String type;
  final String name;
  final String detail;
  final String image;
  Animal({
    this.id,
    required this.type,
    required this.name,
    required this.image,
    required this.detail,
  });
  static Animal fromMap(Map<String, dynamic> map) {
    return Animal(
      id: map["id"],
      type: map["type"],
      name: map["name"],
      image: map["image"],
      detail: map["detail"],
    );
  }
}
