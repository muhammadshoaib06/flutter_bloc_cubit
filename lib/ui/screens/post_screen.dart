import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/post_cubit.dart';
import 'package:flutter_cubit/data/model/model.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostCubit>(context).fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BloC Cubit'),
        ),
        body: BlocBuilder<PostCubit, PostState>(builder: (context, state) {
          if (state is PostInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            final post = (state as PostLoaded).post;
            return SingleChildScrollView(
              child: Column(
                children: post.map((e) => _cardWidget(e, context)).toList(),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 8.0,
                backgroundColor: Colors.green,
              ),
            );
          }
        }));
  }

  Widget _cardWidget(Post post, BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.all(15.0),
      shape:
          Border.all(color: Colors.black, width: 1, style: BorderStyle.solid),
      shadowColor: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${post.id} : ${post.title}',
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              post.body,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
