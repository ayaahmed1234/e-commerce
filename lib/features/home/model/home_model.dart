class HomeModel {
  int?id;

  String?title;
  num?price;
  String? description;
  String? creationAt;
  String ?updatedAt;
  List<String>? images;

  HomeModel(this.id,this.description,this.title,this.price,this.images,this.creationAt,this.updatedAt);
  HomeModel.fromJson(Map<String,dynamic> json){
    id=json["id"];
    title=json["title"];
    price=json["price"];
    description=json["description"];
    images=(json["images"] as List<dynamic>?)?.map((e) => e.toString(),).toList() ;
    creationAt=json["creationAt"];
    updatedAt=json["updatedAt"];

  }
}