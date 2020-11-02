class SubCats {

  final List<Subs> sublist;

  SubCats({this.sublist});

  factory SubCats.fromJson(Map<String, dynamic> parsedJson){

    return SubCats(

        sublist: parsedJson['images']
    );
  }

}

class Subs {
  final int id;
  final String eng_name;
  final String ger_name;
  final String category_id;
  final String description;
  final String image_url;

  Subs({this.id, this.eng_name, this.ger_name, this.category_id,
      this.description, this.image_url});


  factory Subs.fromJson(Map<String, dynamic> parsedJson){
    return Subs(
        id:parsedJson['id'],
        eng_name:parsedJson['eng_name'],
        ger_name:parsedJson['ger_name'],
        category_id:parsedJson['category_id'],
        description:parsedJson['description'],
        image_url:parsedJson['image_url']
    );
  }
}


