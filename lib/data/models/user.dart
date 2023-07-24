class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final DateTime createdAt;
  final DateTime updatedAt;

  User(this.id, this.name, this.email, this.password, this.createdAt,
      this.updatedAt);
}
