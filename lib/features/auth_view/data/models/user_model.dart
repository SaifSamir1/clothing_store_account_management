










class UserInfoModel
{
  String? name;
  String? email;
  String? userId;

  UserInfoModel({
    this.name,
    this.email,
    this.userId,
  });

  UserInfoModel.fromjson(Map<String,dynamic> json)
  {
    name =json['name'] ;
    email =json['email'];
    userId =json['userId'];
  }
  //دي كأنها متغير ماسك فيها البيانات اللي هستخدمها
  Map<String,dynamic> toJson()
  {
    return {
      'name':name,
      'email' : email,
      'userId':userId,
    };
  }
}
