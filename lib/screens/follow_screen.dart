import 'package:flutter/material.dart';
import 'package:manga/model/FollowComicModel.dart';
import 'package:manga/providers/follow_comic_provider.dart';
import 'package:manga/widgets/single_item.dart';
import 'package:provider/provider.dart';

class FollowScreen extends StatelessWidget {
  const FollowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FollowComicProvider followComicProvider = Provider.of(context);
    followComicProvider.getFollowComicData();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Comicolors',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            )),
        backgroundColor: Colors.deepOrange,
      ),
      body:
        ListView.builder(
          itemCount: followComicProvider.getFollowComicList.length,
          itemBuilder: (context, index) {
            FollowComicModel data = followComicProvider.getFollowComicList[index];
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SingleItem(isBool: false,
                    name: data.followName,
                    image: data.followImage,
                    description: data.followDescription,
                    onTap: () {},
                    chapterPage: []),
              ],
            );
          }),
    );
  }
}
