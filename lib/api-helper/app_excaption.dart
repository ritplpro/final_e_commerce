class AppException implements Exception{
  String title;
  String msg;

  AppException({required this.title,required this.msg});

  toErrormsg(){
    return "$title:$msg";
  }
}


class FetchDataException extends AppException{
  FetchDataException({required String errormsg}):super(title: "network error",msg: "error msg");
}


class BadRequestException extends AppException{
  BadRequestException({required String errormsg}):super(title: "invalid request",msg: "error msg");
}


class UnAutrosiedException extends AppException{
  UnAutrosiedException({required String errormsg}):super(title: "unautrosied",msg: "error msg");
}


class InvalidInputException extends AppException{
  InvalidInputException({required String errormsg}):super(title: "invalid input",msg: "error msg");
}