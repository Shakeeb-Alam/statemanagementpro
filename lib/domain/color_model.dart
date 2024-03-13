class Notes {
  String title;
  String description;
  int red;

  Notes({ required this.title, required this.description,required this.red });

  Notes.fromMap(Map map):
        title = map["title"],
        description = map["description"],
         red = map["red"];

  Map toMap(){
    return {
      "title" : title,
      "description" : description,
      "red" : red,
    };
  }
}