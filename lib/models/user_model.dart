class User {
  final int? id;
  final String name;
  final String username;
  final String password; // Consider hashing this before storing

  User({
    this.id,
    required this.name,
    required this.username,
    required this.password,
  });

  // Factory constructor to create a User from a Map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      username: map['username'],
      password: map['password'], // Ensure this is securely handled
    );
  }

  // Convert User to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'password': password, // Consider excluding this if sensitive
    };
  }

  @override
  String toString() {
    return 'User {id: $id, name: $name, username: $username}'; // Exclude password for security
  }
}