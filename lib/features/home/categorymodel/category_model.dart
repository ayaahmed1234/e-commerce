class CategoryModel {
  String ?categoryName;
  String?slug;
  CategoryModel(this.categoryName,this.slug);
  CategoryModel.fromJson(Map<String,dynamic> json){
    categoryName=json["name"];
    slug=json["slug"];
  }
}