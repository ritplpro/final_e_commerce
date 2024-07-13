class CategoryModal {
  bool? status;
  String? message;
  List<Data>? data;

  CategoryModal({required this.status, required this.message, required this.data});




  factory CategoryModal.fromJson(Map<String, dynamic> json) {
    List<Data> aData = [];
    for (Map<String, dynamic>eachJson in json["data"]) {
      var alldata = Data.fromJson(eachJson);
      aData.add(alldata);
    }

    return CategoryModal(
        status: json["status"],
        message: json["message"],
        data: aData);
  }




  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}






class Data {
  String? id;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
