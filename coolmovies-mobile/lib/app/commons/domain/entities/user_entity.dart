class UserEntity {
  UserEntity({
    required this.id,
    required this.name,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        id: json['id'],
        name: json['name'],
      );

  final String id;
  final String name;
}
