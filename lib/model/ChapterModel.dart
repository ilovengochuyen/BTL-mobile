class ChapterModel {
  String name = '';
  String image = '';
  String description = '';
  List<dynamic> chapterPage = [];

  ChapterModel({required this.image,
    required this.name, required this.description,
    required this.chapterPage});
}