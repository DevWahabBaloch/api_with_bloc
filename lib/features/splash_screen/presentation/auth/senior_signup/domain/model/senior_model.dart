class SeniorModel {
  final Documents? documents;
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final int? role;
  final String? profilePicture;
  final String? emailVerifiedAt;
  final bool? emailVerified;
  final String? verificationToken;
  final String? provider;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final List<String>? idCardDocuments;
  final List<String>? socialSecurityDocuments;
  final List<String>? hudVoucherDocuments;
  final List<String>? incomeDocuments;
  final List<String>? bankStatementDocuments;
  final int? profileCompleteness;

  SeniorModel({
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
    this.v,
    this.idCardDocuments,
    this.socialSecurityDocuments,
    this.hudVoucherDocuments,
    this.incomeDocuments,
    this.bankStatementDocuments,
    this.profileCompleteness,
  });

  factory SeniorModel.fromJson(Map<String, dynamic> json) {
    return SeniorModel(
      documents: json['documents'] != null ? Documents.fromJson(json['documents']) : null,
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
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      v: json['__v'],
      idCardDocuments: json['idCardDocuments'] != null ? List<String>.from(json['idCardDocuments']) : null,
      socialSecurityDocuments: json['socialSecurityDocuments'] != null ? List<String>.from(json['socialSecurityDocuments']) : null,
      hudVoucherDocuments: json['hudVoucherDocuments'] != null ? List<String>.from(json['hudVoucherDocuments']) : null,
      incomeDocuments: json['incomeDocuments'] != null ? List<String>.from(json['incomeDocuments']) : null,
      bankStatementDocuments: json['bankStatementDocuments'] != null ? List<String>.from(json['bankStatementDocuments']) : null,
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
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
      'idCardDocuments': idCardDocuments,
      'socialSecurityDocuments': socialSecurityDocuments,
      'hudVoucherDocuments': hudVoucherDocuments,
      'incomeDocuments': incomeDocuments,
      'bankStatementDocuments': bankStatementDocuments,
      'profileCompleteness': profileCompleteness,
    };
  }
}

class Documents {
  final List<String>? idCard;
  final List<String>? socialSecurity;
  final List<String>? hudVoucher;
  final List<String>? bankStatement;
  final List<String>? income;

  Documents({
    this.idCard,
    this.socialSecurity,
    this.hudVoucher,
    this.bankStatement,
    this.income,
  });

  factory Documents.fromJson(Map<String, dynamic> json) {
    return Documents(
      idCard: json['idCard'] != null ? List<String>.from(json['idCard']) : null,
      socialSecurity: json['socialSecurity'] != null ? List<String>.from(json['socialSecurity']) : null,
      hudVoucher: json['hudVoucher'] != null ? List<String>.from(json['hudVoucher']) : null,
      bankStatement: json['bankStatement'] != null ? List<String>.from(json['bankStatement']) : null,
      income: json['income'] != null ? List<String>.from(json['income']) : null,
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
