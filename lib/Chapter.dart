class Chapter {
  final String name;
  final String image;
  Chapter(this.name, this.image);
  static List<Chapter> getChapters() {
    List<Chapter> items = <Chapter>[];
    items.add(
        Chapter(
            "Pixel",
            "pixel.jpg"
        )
    );
    items.add(
        Chapter(
            "Laptop",
            "laptop.jpg"
        )
    );
    items.add(
        Chapter(
            "Tablet",
            "tablet.jpg"
        )
    );
    items.add(
        Chapter(
            "Pendrive",
            "pendrive.jpg")
    );
    items.add(
        Chapter(
            "Floppy Drive",
            "floppy.jpg"
        )
    );
    items.add(
        Chapter(
            "iPhone",
            "iphone.jpg"
        )
    );
    return items;
  }
}