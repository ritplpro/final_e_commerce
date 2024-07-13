class ProductsModal {
  bool? status;
  String? message;
  List<Data>? data;

  ProductsModal({required this.status, required this.message, required this.data});

  factory ProductsModal.fromPJson(Map<String, dynamic> json) {
    List<Data> aData=[];

    for(Map<String,dynamic>eachJson in json["data"]){
      var alldata=Data.fromDJson(eachJson);
      aData.add(alldata);
    }


    return ProductsModal(status: json["status"],
        message: json["message"],
        data: aData);

  }

  Map<String, dynamic> toPJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toDJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? price;
  String? image;
  String? categoryId;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.price,
        this.image,
        this.categoryId,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromDJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    categoryId = json['category_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toDJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['category_id'] = this.categoryId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
