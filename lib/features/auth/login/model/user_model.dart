class UserModel {
  String? refreshtoken;
  UserModel({
    this.refreshtoken
});
  UserModel.fromjson(Map<String,dynamic> json){
    refreshtoken=json["refresh_token"];
  }
}