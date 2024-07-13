
class JsonModal {
  bool? status;
  String? message;
  String? tokan;

  JsonModal({this.status, this.message, this.tokan});

   factory JsonModal.fromJson(Map<String, dynamic> json) {
    return JsonModal(status: json["status"],message: json["message"],tokan: json["tokan"]);
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "tokan": tokan,
  };

}

class LoginModal {
  final String email;
  final String password;

  LoginModal({required this.email, required this.password});

  factory LoginModal.fromJson(Map<String, dynamic> json) {
    return LoginModal(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}




