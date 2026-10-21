class CategoryModel {
  String ?categoryName;
  int?id;
  String?slug;
  CategoryModel(this.categoryName,this.slug,this.id);
  CategoryModel.fromJson(Map<String,dynamic> json){
    categoryName=json["name"];
    id=json["id"];
    slug=json["slug"];
  }
}