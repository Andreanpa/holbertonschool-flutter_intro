class Character {
  final String name;
  final String img;
  final int id;

  Character({required this.name, required this.img, required this.id});

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        name: json['name'],
        img: json['img'],
        id: json['id'],
      );
}
