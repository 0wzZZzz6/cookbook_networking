import '../model/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Post>> fetchPost() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((post) => new Post.fromJson(post)).toList();
    // return Post.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load post');
  }
}
