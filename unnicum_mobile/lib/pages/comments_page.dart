import 'package:flutter/material.dart';
import '../utilities/glow/noglow.dart';
import '../widgets/comment_tile.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String url =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWtMDksH9GzFdMinyAkGbtLJNx6xynLETTNN5akjxirL3QD5Rj';
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(url),
                  ),
                ),
                Text('Description'),
              ],
            ),
            const Divider(),
            Expanded(
              child: ScrollConfiguration(
                behavior: NoGlowBehavior(),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      CommentTile(
                        url: url,
                        text: 'text',
                        date: DateTime.now(),
                      ),
                      CommentTile(
                        url: url,
                        text: 'text',
                        date: DateTime.now(),
                      ),
                      CommentTile(
                        url: url,
                        text: 'text',
                        date: DateTime.now(),
                      ),
                      CommentTile(
                        url: url,
                        text: 'text',
                        date: DateTime.now(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(url),
                  ),
                ),
                const Expanded(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: 'Comment...',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send_rounded,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
