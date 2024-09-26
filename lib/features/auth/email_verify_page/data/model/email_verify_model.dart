class EmailVerifyModel {
  List<String>? responseMessage;
  int? responseCode;
  Map<String, dynamic>? responseData;

  EmailVerifyModel({
    this.responseMessage,
    this.responseCode,
    this.responseData,
  });

  // Factory constructor to create an instance from JSON
  factory EmailVerifyModel.fromJson(Map<String, dynamic> json) {
    return EmailVerifyModel(
      responseMessage: (json['responseMessage'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      responseCode: json['responseCode'] as int?,
      responseData: json['responseData'] as Map<String, dynamic>?,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'responseMessage': responseMessage,
      'responseCode': responseCode,
      'responseData': responseData,
    };
  }
}