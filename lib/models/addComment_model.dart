
import 'dart:convert';

List<AddCommentModel> addCommentModelFromJson(String str) => List<AddCommentModel>.from(json.decode(str).map((x) => AddCommentModel.fromJson(x)));


class AddCommentModel {
    int postId;
    int id;
    String name;
    String email;
    String body;

    AddCommentModel({
        required this.postId,
        required this.id,
        required this.name,
        required this.email,
        required this.body,
    });

    factory AddCommentModel.fromJson(Map<String, dynamic> json) => AddCommentModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
    );

    
}
