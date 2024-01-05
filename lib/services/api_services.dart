import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:taskapp/models/comments_model.dart';
import 'package:taskapp/models/posts_model.dart';

var base = "https://jsonplaceholder.typicode.com";

getPosts() async {
  Uri url = Uri.parse("$base/posts");
  var res = await http.get(url);

  try {
    if (res.statusCode == 200) {
      var data = postsModelFromJson(res.body);
      return data;
    } else {
      print("Error during connection");
    }
  } catch (e) {
    print(e.toString());
  }
}

getComments(int id) async {
  Uri url = Uri.parse("$base/posts/$id/comments");
  var res = await http.get(url);

  try {
    if (res.statusCode == 200) {
      var data = commentModelFromJson(res.body);
      return data;
    } else {
      print("Error during connection");
    }
  } catch (e) {
    print(e.toString());
  }
}

addComments(String name, String email, String body) async {
  Uri url = Uri.parse("$base/posts/1/comments");
  var data = {'name': name, 'email': email, "body": body};
  var post = await http.post(
    url,
    body: data,
  );
  ;

  try {
    if (post.statusCode == 200) {
      var jsonData = jsonDecode(post.body);
      print(jsonData);
      print("Data uploaded successfully");
    } else {
      print("Error during posting data");
    }
  } catch (e) {
    print(e.toString());
  }
}
