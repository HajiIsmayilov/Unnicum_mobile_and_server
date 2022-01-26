import 'package:flutter/material.dart';
import '../utilities/glow/noglow.dart';
import '../widgets/comment_tile.dart';

class CommentsOldPage extends StatelessWidget {
  const CommentsOldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String url =
        // 'https://avatars0.githubusercontent.com/u/8264639?s=460&v=4'
        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWtMDksH9GzFdMinyAkGbtLJNx6xynLETTNN5akjxirL3QD5Rj';
    double size = 80;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: NoGlowBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //color: Colors.blue,
                color: Colors.grey[200],
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 28),
                      child: IconButton(
                        onPressed: () {},
                        icon: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - size - 85,
                color: Colors.grey[200],
                child: ScrollConfiguration(
                  behavior: NoGlowBehavior(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        CommentTile(
                          url: url,
                          text:
                              'textdjfdhjfhdjfhjdhfjdjfjdhfjhdjfhdjfhdjhfjdhfjdhfjdjfhdjfjdhfjdhfjd😊😊😊\nssd\ndsds',
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
              Container(
                height: size,
                //color: Colors.red,
                padding: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        right: 5,
                      ),
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundImage: NetworkImage(url),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Comment...',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 5,
                      ),
                      child: const Text(
                        'Post',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
