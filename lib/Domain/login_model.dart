class LoginModel {
  String? accessToken;
  String? refreshToken;
  String? tokenType;
  int? expiresIn;
  User? user;
  String? message;

  LoginModel(
      {this.accessToken,
        this.refreshToken,
        this.tokenType,
        this.expiresIn,
        this.user,
        this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  Null? phoneNumber;
  Null? createdAt;
  Null? updatedAt;
  String? hydrationLimit;
  String? hydrationLimitUnit;
  String? caloriesLimit;
  String? caloriesLimitUnit;
  String? profileImage;
  Null? otp;
  Null? otpExpiry;
  Null? stripeId;
  Null? pmType;
  Null? pmLastFour;
  Null? trialEndsAt;
  int? noOfJournals;
  int? communityId;
  List<LatestMeasurements>? latestMeasurements;
  List<Journals>? journals;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.createdAt,
        this.updatedAt,
        this.hydrationLimit,
        this.hydrationLimitUnit,
        this.caloriesLimit,
        this.caloriesLimitUnit,
        this.profileImage,
        this.otp,
        this.otpExpiry,
        this.stripeId,
        this.pmType,
        this.pmLastFour,
        this.trialEndsAt,
        this.noOfJournals,
        this.communityId,
        this.latestMeasurements,
        this.journals});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hydrationLimit = json['hydration_limit'];
    hydrationLimitUnit = json['hydration_limit_unit'];
    caloriesLimit = json['calories_limit'];
    caloriesLimitUnit = json['calories_limit_unit'];
    profileImage = json['profile_image'];
    otp = json['otp'];
    otpExpiry = json['otp_expiry'];
    stripeId = json['stripe_id'];
    pmType = json['pm_type'];
    pmLastFour = json['pm_last_four'];
    trialEndsAt = json['trial_ends_at'];
    noOfJournals = json['no_of_journals'];
    communityId = json['community_id'];
    if (json['latest_measurements'] != null) {
      latestMeasurements = <LatestMeasurements>[];
      json['latest_measurements'].forEach((v) {
        latestMeasurements!.add(new LatestMeasurements.fromJson(v));
      });
    }
    if (json['journals'] != null) {
      journals = <Journals>[];
      json['journals'].forEach((v) {
        journals!.add(new Journals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['hydration_limit'] = this.hydrationLimit;
    data['hydration_limit_unit'] = this.hydrationLimitUnit;
    data['calories_limit'] = this.caloriesLimit;
    data['calories_limit_unit'] = this.caloriesLimitUnit;
    data['profile_image'] = this.profileImage;
    data['otp'] = this.otp;
    data['otp_expiry'] = this.otpExpiry;
    data['stripe_id'] = this.stripeId;
    data['pm_type'] = this.pmType;
    data['pm_last_four'] = this.pmLastFour;
    data['trial_ends_at'] = this.trialEndsAt;
    data['no_of_journals'] = this.noOfJournals;
    data['community_id'] = this.communityId;
    if (this.latestMeasurements != null) {
      data['latest_measurements'] =
          this.latestMeasurements!.map((v) => v.toJson()).toList();
    }
    if (this.journals != null) {
      data['journals'] = this.journals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LatestMeasurements {
  String? name;
  String? updatedAt;

  LatestMeasurements({this.name, this.updatedAt});

  LatestMeasurements.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Journals {
  int? id;
  int? userId;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  Null? description;
  Null? descriptionQuestion;

  Journals(
      {this.id,
        this.userId,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
        this.description,
        this.descriptionQuestion});

  Journals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    description = json['description'];
    descriptionQuestion = json['description_question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['description'] = this.description;
    data['description_question'] = this.descriptionQuestion;
    return data;
  }
}
