// UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
//
// String userModelToJson(UserModel data) => json.encode(data.toJson());
// class UserModel {
//   int id;
//   String name;
//   String username;
//   String email;
//   Address address;
//   String phone;
//   String website;
//   Company company;
//
//   UserModel({
//      this.id,
//      this.name,
//      this.username,
//      this.email,
//      this.address,
//      this.phone,
//      this.website,
//      this.company,
//   });
//
//   factory UserModel.fromJson(Map<String, dynamic> json) =>
//       UserModel(
//         id: json["id"],
//         name: json["name"],
//         username: json["username"],
//         email: json["email"],
//         address: Address.fromJson(json["address"]),
//         phone: json["phone"],
//         website: json["website"],
//         company: Company.fromJson(json["company"]),
//       );
//}