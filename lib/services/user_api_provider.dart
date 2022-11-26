import 'dart:convert';

import 'package:bloc_network_example/models/user.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  Future<List<User>> getUsers() async{
    final response = await http.get(Uri.parse('http://jsonplaceholder.typicode.com/users'));
    if(response.statusCode==200){
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    }else{
      throw Exception('Error with getting users');
    }
  }
}