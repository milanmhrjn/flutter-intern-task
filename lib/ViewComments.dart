import 'package:flutter/material.dart';
import 'package:taskapp/AddComment.dart';

import 'package:taskapp/models/comments_model.dart';
import 'package:taskapp/services/api_services.dart';

class ViewComments extends StatelessWidget {
  const ViewComments({super.key});
  static const routeName = '/viewComment';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments.toString();
    int id = int.parse(args);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("View Comments"),
            centerTitle: true,
          ),
          body: FutureBuilder(
            future: getComments(id),
            builder: ((context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<CommentModel> comments = snapshot.data;
                return ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        margin: EdgeInsets.all(7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.all(10)),
                            Text("postId: ${comments[index].postId}"),
                            SizedBox(
                              height: 7,
                            ),
                            Text("id: ${comments[index].id}"),
                            SizedBox(
                              height: 7,
                            ),
                            Text("name: ${comments[index].name}"),
                            SizedBox(
                              height: 7,
                            ),
                            Text("email: ${comments[index].email}"),
                            SizedBox(
                              height: 7,
                            ),
                            Text("body: ${comments[index].body}"),
                            SizedBox(
                              height: 7,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => AddComment())));
                              },
                              child: Text("Add Comments"),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(20)),
                              ),
                            ),
                          ],
                        ));
                  },
                );
              }
            }),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ));
  }
}
