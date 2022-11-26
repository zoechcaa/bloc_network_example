import 'package:bloc_network_example/models/user.dart';
import 'package:bloc_network_example/services/user_api_provider.dart';

class UserRepository{
  final UserProvider _usersProvider = UserProvider();
  Future<List<User>> getAllUsers() => _usersProvider.getUsers();
}