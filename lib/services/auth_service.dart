import 'package:loyalty_app/models/user.dart';

class AuthService {
  final List<User> _users = [
    User(id: 'User1', name: 'Smile Challenge', email: 'smile@smilefokus.com'),
    User(id: 'User2', name: 'John Doe', email: 'john@doe.com'),
    User(id: 'User3', name: 'Jane Smith', email: 'jane@smith.com'),
  ];

  Future<User?> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    // final user = _users.firstWhere(
    //   (u) => u.email == email && password == '11111111',
    //   orElse: () => throw Exception('Invalid credentials'),
    // );
    return User(id: 'User1', name: 'Smile Challenge', email: 'john@doe.com');
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
