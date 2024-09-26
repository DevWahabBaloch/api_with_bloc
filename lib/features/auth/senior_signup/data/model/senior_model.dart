class SeniorModel {
  List<String>? responseMessage;
  int? responseCode;
  ResponseData? responseData;

  SeniorModel({this.responseMessage, this.responseCode, this.responseData});

  factory SeniorModel.fromJson(Map<String, dynamic> json) {
    return SeniorModel(
      responseMessage: json['responseMessage'] != null
          ? List<String>.from(json['responseMessage'])
          : null,
      responseCode: json['responseCode'],
      responseData: json['responseData'] != null
          ? ResponseData.fromJson(json['responseData'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'responseMessage': responseMessage,
      'responseCode': responseCode,
      'responseData': responseData?.toJson(),
    };
  }
}

class ResponseData {
  Token? token;
  List<User>? user;

  ResponseData({this.token, this.user});

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      token: json['token'] != null ? Token.fromJson(json['token']) : null,
      user: json['user'] != null
          ? List<User>.from(json['user'].map((u) => User.fromJson(u)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token?.toJson(),
      'user': user?.map((u) => u.toJson()).toList(),
    };
  }
}

class Token {
  String? accessToken;
  String? refreshToken;
  int? refreshTokenExpiry;
  int? accessTokenExpiry;

  Token(
      {this.accessToken,
      this.refreshToken,
      this.refreshTokenExpiry,
      this.accessTokenExpiry});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      refreshTokenExpiry: json['refreshTokenExpiry'],
      accessTokenExpiry: json['accessTokenExpiry'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'refreshTokenExpiry': refreshTokenExpiry,
      'accessTokenExpiry': accessTokenExpiry,
    };
  }
}

class User {
  Documents? documents;
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  int? role;
  String? profilePicture;
  String? emailVerifiedAt;
  bool? emailVerified;
  String? verificationToken;
  String? provider;
  String? createdAt;
  String? updatedAt;
  int? profilePercentage;
  int? applicationType;
  String? documentsCount;
  int? profileCompleteness;

  User({
    this.documents,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.profilePicture,
    this.emailVerifiedAt,
    this.emailVerified,
    this.verificationToken,
    this.provider,
    this.createdAt,
    this.updatedAt,
    this.profilePercentage,
    this.applicationType,
    this.documentsCount,
    this.profileCompleteness,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      documents: json['documents'] != null
          ? Documents.fromJson(json['documents'])
          : null,
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      role: json['role'],
      profilePicture: json['profilePicture'],
      emailVerifiedAt: json['emailVerifiedAt'],
      emailVerified: json['emailVerified'],
      verificationToken: json['verificationToken'],
      provider: json['provider'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      profilePercentage: json['profilePercentage'],
      applicationType: json['applicationType'],
      documentsCount: json['documentsCount'],
      profileCompleteness: json['profileCompleteness'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'documents': documents?.toJson(),
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'role': role,
      'profilePicture': profilePicture,
      'emailVerifiedAt': emailVerifiedAt,
      'emailVerified': emailVerified,
      'verificationToken': verificationToken,
      'provider': provider,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'profilePercentage': profilePercentage,
      'applicationType': applicationType,
      'documentsCount': documentsCount,
      'profileCompleteness': profileCompleteness,
    };
  }
}

class Documents {
  List<dynamic>? idCard;
  List<dynamic>? socialSecurity;
  List<dynamic>? hudVoucher;
  List<dynamic>? bankStatement;
  List<dynamic>? income;

  Documents({
    this.idCard,
    this.socialSecurity,
    this.hudVoucher,
    this.bankStatement,
    this.income,
  });

  factory Documents.fromJson(Map<String, dynamic> json) {
    return Documents(
      idCard:
          json['idCard'] != null ? List<dynamic>.from(json['idCard']) : null,
      socialSecurity: json['socialSecurity'] != null
          ? List<dynamic>.from(json['socialSecurity'])
          : null,
      hudVoucher: json['hudVoucher'] != null
          ? List<dynamic>.from(json['hudVoucher'])
          : null,
      bankStatement: json['bankStatement'] != null
          ? List<dynamic>.from(json['bankStatement'])
          : null,
      income:
          json['income'] != null ? List<dynamic>.from(json['income']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idCard': idCard,
      'socialSecurity': socialSecurity,
      'hudVoucher': hudVoucher,
      'bankStatement': bankStatement,
      'income': income,
    };
  }
}
