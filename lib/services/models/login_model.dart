class SignUpModel {
  final String userId;

  const SignUpModel({required this.userId});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      userId: json['userId'],
    );
  }
}