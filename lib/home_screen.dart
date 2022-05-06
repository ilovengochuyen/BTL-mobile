import 'package:flutter/material.dart';
import 'package:home_screen/single_comic.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _buildNewestComic(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mới nhất',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              Text('Xem tất cả',
                  style: TextStyle(
                    color: Colors.grey[400],
                  )),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingleComic(
                onTap: () {},
                image: 'https://techkalzen.com/wp-content/uploads/2020/03/violet-evergarden-the-movie-poster.jpg',
                //"http://static2.minitokyo.net/view/45/00/62545.jpg",
                name: 'Violet Evergarden',
              ),

              SingleComic(
                onTap: () {},
                image:
                "http://static2.minitokyo.net/view/43/04/290243.jpg",
                name: 'Chobits',
              ),

              SingleComic(
                onTap: () {},
                image:
                "http://static2.minitokyo.net/view/28/44/527228.jpg",
                name: 'Tsubasa Chronicle',
              ),

              SingleComic(
                onTap: () {},
                image:
                "http://static.minitokyo.net/downloads/10/32/491610.jpg",
                name: 'CardCaptor Sakura',
              ),

            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHottestComic(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Hấp dẫn nhất',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              Text('Xem tất cả',
                  style: TextStyle(
                    color: Colors.grey[400],
                  )),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [

              SingleComic(
                onTap: () {},
                image:
                "http://static2.minitokyo.net/view/45/00/62545.jpg",
                name: 'One Piece',
              ),

              SingleComic(
                onTap: () {},
                image:
                "http://static2.minitokyo.net/view/49/24/673749.jpg",
                name: 'Naruto',
              ),

              SingleComic(
                onTap: () {},
                image:
                "http://static2.minitokyo.net/view/05/32/444105.jpg",
                name: 'D Gray-Man',
              ),

              SingleComic(
                onTap: () {},
                image:
                "http://static2.minitokyo.net/view/37/37/386887.jpg",
                name: 'Inuyasha',
              ),

            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionComic(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Hành động',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              Text('Xem tất cả',
                  style: TextStyle(
                    color: Colors.grey[400],
                  )),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [

              SingleComic(
                onTap: () {},
                image:
                "http://static2.minitokyo.net/view/00/23/663650.jpg",
                name: 'Fairy Tail',
              ),

              SingleComic(
                onTap: () {},
                image:
                "http://static2.minitokyo.net/view/37/37/386887.jpg",
                name: 'Inuyasha',
              ),
              SingleComic(
                onTap: () {},
                image:
                "http://static2.minitokyo.net/view/45/00/62545.jpg",
                name: 'One Piece',
              ),

              SingleComic(
                onTap: () {},
                image:
                "http://static2.minitokyo.net/view/49/24/673749.jpg",
                name: 'Naruto',
              ),



            ],
          ),
        ),
      ],
    );
  }


/*  Widget SingleComic() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 180,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[100],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage('https://techkalzen.com/wp-content/uploads/2020/03/violet-evergarden-the-movie-poster.jpg'),
                      fit: BoxFit.fill
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Violet Evergarden',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Comico',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            )),
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.white,
            child: Icon(Icons.search, size: 17, color: Colors.black,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
                child: Icon(Icons.shop, size: 17, color: Colors.black,)
            ),
          ),

        ],
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              //height: 200,
              child: Carousel(),
            ),
            _buildNewestComic(context),
            _buildHottestComic(context),
            _buildActionComic(context),


            /*Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hấp dẫn nhất',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  Text('Xem tất cả',
                      style: TextStyle(
                        color: Colors.grey[400],
                      )),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleComic(),
                  SingleComic(),
                  SingleComic(),
                  SingleComic(),
                  SingleComic(),
                ],
              ),
            ),*/

          ],
        ),
      )
    );
  }
}

class Carousel extends StatefulWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;

  List<String> images = [
    "https://c4.wallpaperflare.com/wallpaper/923/685/115/violet-evergarden-anime-girls-violet-evergarden-anime-water-wallpaper-preview.jpg",
    "https://c4.wallpaperflare.com/wallpaper/984/1000/1024/anime-violet-evergarden-violet-evergarden-character-wallpaper-preview.jpg",
    "https://c4.wallpaperflare.com/wallpaper/280/611/595/anime-violet-evergarden-violet-evergarden-character-wallpaper-preview.jpg"
  ];

  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(images,pagePosition,active);
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length,activePage))
      ],
    );
  }
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 10 : 20;

  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(images[pagePosition]))),
  );
}

imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      print(pagePosition);

      return SizedBox(
        width: 200,
        height: 200,
        child: widget,
      );
    },
    child: Container(
      margin: EdgeInsets.all(10),
      child: Image.network(images[pagePosition]),
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}
