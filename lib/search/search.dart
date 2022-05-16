import 'package:flutter/material.dart';
import 'package:manga/model/ComicModel.dart';

import 'package:manga/widgets/single_item.dart';
import '../comic/comic_page.dart';

class SearchPage extends StatefulWidget {
  final List<ComicModel> search;

  SearchPage({required this.search});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = "";

  searchItem (String query) {
    List<ComicModel> searchComic = widget.search.where((element){
      return element.name.toLowerCase().contains(query);
    }).toList();
    return searchComic;
  }

  @override
  Widget build(BuildContext context) {
    List<ComicModel> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        children: [
          SizedBox(height: 15),
          Container(
            height: 52,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: ((value) {
                print(value);
                query = value;
              }),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey[200],
                filled: true,
                hintText:"Tìm kiếm",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(height: 15,),
          Column(
            children: _searchItem.map((data) {
              return SingleItem(
                  isBool: false,
                  name: data.name,
                  image: data.image,
                  description: data.description,
                  onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ComicPage(image: data.image,
                        name: data.name, genres: data.genres, description: data.description,
                        author: data.author),
                  ),
                );},);
            }).toList(),


          ),
        ],
      ),
    );
  }
}


