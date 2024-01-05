import 'package:flutter/material.dart';
import 'package:taskapp/ViewComments.dart';
import 'package:taskapp/models/posts_model.dart';
import 'package:taskapp/services/api_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {ViewComments.routeName: (context) => const ViewComments()},
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("List of all the posts"),
            centerTitle: true,
          ),
          body: FutureBuilder(
            future: getPosts(),
            builder: ((context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<PostsModel> posts = snapshot.data;
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        margin: EdgeInsets.all(7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.all(10)),
                                  Text(
                                    "userId: ${posts[index].userId}",
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text("id: ${posts[index].id}"),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text("title: ${posts[index].title}"),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text("body: ${posts[index].body}"),
                                  SizedBox(
                                    height: 7,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      ViewComments.routeName,
                                      arguments: (posts[index].id),
                                    );
                                  },
                                  child: Text("View Comments"),
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.all(20)),
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ));
                  },
                );
              }
            }),
          ),
        ));
  }
}
